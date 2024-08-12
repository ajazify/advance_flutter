import 'package:get/get.dart';
import 'package:getx_state_management/core/network/api_provider.dart';
import 'package:getx_state_management/module/users_list/model/users_list_response.dart';

class UsersListController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  var resp = <UsersListResponse>[].obs;
  late String name;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading.value = true;
      List<UsersListResponse> response = await ApiProvider().fetchUsers();
      name = response[0].company!.name ?? 'Company Name';
      print(name); 
      if (response.isEmpty) {
        isError.value = true;
      } else {
        resp.assignAll(response);
      }
    } catch (e, stackTrace) {
      isError.value = true;
      print('Error fetching users: $e');
      print('Stack trace: $stackTrace');
    } finally {
      isLoading.value = false;
    }
  }
}

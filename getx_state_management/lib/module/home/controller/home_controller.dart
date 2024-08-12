import 'package:get/get.dart';
import 'package:getx_state_management/module/users_list/controller/users_list_controller.dart';

class HomeController extends GetxController {
  RxString name = ''.obs;
  @override
  void onInit() {
    var userListController = Get.find<UsersListController>();
    print(userListController.name);
    name.value = userListController.name; 
    print('Home Controller is running');
    super.onInit();
  }
}

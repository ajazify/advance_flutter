import 'package:get/get.dart';
import 'package:getx_state_management/module/home/controller/home_controller.dart';
import 'package:getx_state_management/module/users_list/controller/users_list_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsersListController());
    Get.lazyPut(() => HomeController());
  }
}

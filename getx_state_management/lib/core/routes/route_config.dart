import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_state_management/core/routes/route_const.dart';
import 'package:getx_state_management/module/home/view/home.dart';
import 'package:getx_state_management/module/users_list/view/users_list.dart';

class RouteConfig {
  static final List<GetPage> routes = [
    GetPage(name: RouteConst.usersList, page: () => const UsersList()),
    GetPage(name: RouteConst.usersList, page: () => const UsersList()),
    GetPage(name: RouteConst.home, page: () => const Home()),
  ];
}

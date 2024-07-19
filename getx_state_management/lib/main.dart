import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'core/routes/route_config.dart';
import 'module/users_list/view/users_list.dart';
import 'package:getx_state_management/binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Pattern',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialBinding: BindingController(),
      getPages: RouteConfig.routes,
      home: const UsersList(),
    );
  }
}

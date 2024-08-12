import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/module/home/controller/home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: Center(
          child: Text(controller.name.value),
        ),
      ),
    );
  }
} 

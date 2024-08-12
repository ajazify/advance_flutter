import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/core/routes/route_const.dart';
import 'package:getx_state_management/module/users_list/controller/users_list_controller.dart';
import 'dart:math';

class UsersList extends GetView<UsersListController> {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.value
          ? const Scaffold(
              body: LinearProgressIndicator(),
            )
          : controller.isError.value
              ? const Scaffold(
                  body: Center(
                    child: Text('Something Gone Wrong!'),
                  ),
                )
              : Scaffold(
                  body: ListView.separated(
                    itemCount: controller.resp.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: () {
                          Get.toNamed(RouteConst.home); 
                        },
                        autofocus: true,
                        style: ListTileStyle.list,
                        trailing: Text(controller.resp[index].phone ?? '+91'),
                        leading: CircleAvatar(
                          backgroundColor: getRandomPastelColor(),
                          child: Text(
                            controller.resp[index].name![0],
                            style: const TextStyle(color: Color.fromARGB(255, 127, 127, 127)),
                          ),
                        ),
                        title: Text(controller.resp[index].name ?? 'name'),
                        subtitle: Text(controller.resp[index].email ?? '@gmail.com'),
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                  ),
                ),
    );
  }

  Color getRandomPastelColor() {
    final Random random = Random();
    return Color.fromARGB(
      255,
      150 + random.nextInt(106), // Red value between 150 and 255
      150 + random.nextInt(106), // Green value between 150 and 255
      150 + random.nextInt(106), // Blue value between 150 and 255
    );
  }
}

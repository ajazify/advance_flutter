import 'package:dynamic_tabview/list_controller.dart';
import 'package:flutter/material.dart';

class ListHome extends StatelessWidget {
  final String keyForApiCall;
  const ListHome({super.key, required this.keyForApiCall});

  @override
  Widget build(BuildContext context) {
    ListController listController = ListController();
    //! Simply generate a list view based on the id received (keyForApiCall)
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: listController.listReturn(keyForApi: keyForApiCall).length,
          itemBuilder: (BuildContext context, int index) {
            return Text(listController.listReturn(keyForApi: keyForApiCall)[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider();
          },
        ),
      ),
    );
  }
}

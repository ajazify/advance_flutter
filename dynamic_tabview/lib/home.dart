import 'package:dynamic_tabview/controller.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();
    return Scaffold(
      //! Set Default Tab Controller
      body: DefaultTabController(
        length: homeController.fetchTitleWidget().length,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: homeController.fetchTitleWidget()),
            title: const Text('Fully Dynamic Tabview'),
            centerTitle: true,
          ),
          //! Set TabView Which should be equal to Tab Controller
          body: TabBarView(
            children: homeController.widgetGenerator(),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:network_exception_handler/network.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Exception handler by ajazify',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: false,
      ),
      home: const Home(title: 'Exception handler by ajazify'),
    );
  }
}

class Home extends StatelessWidget {
  final String title;
  const Home({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Call Network Api'),
              onPressed: () {
                //! Call GetMethod from NetworkHandler to trigger the api call
                NetworkHandler().getMethod();
              },
            ),
            const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.coffee,
                  size: 20,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Follow and If you like support with a coffee!'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

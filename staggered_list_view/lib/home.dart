import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,          
        body: MasonryGridView.builder( 
          itemCount: 15,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child:
                  ClipRRect(borderRadius: BorderRadius.circular(12), child: Image.asset('images/img${index + 1}.jpg')),
            );
          },
        ));
  }
}

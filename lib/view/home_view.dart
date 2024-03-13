import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ElevatedButton(
            onPressed: (){
              
            },
            child: const Text('사진첩 열기')
        )
      ]
    );
  }
}

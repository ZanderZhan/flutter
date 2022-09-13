import 'package:flutter/material.dart';
import 'package:navigator/main_router.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Screen3'),
            GestureDetector(
              onTap: () {
                MyApp.of(context).delegate.push('screen1');
              },
              child: const Text('Screen1'),
            )
          ],
        ),
      ),
    );
  }
}

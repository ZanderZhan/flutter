import 'package:flutter/material.dart';
import 'package:navigator/main_router.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Screen2'),
            GestureDetector(
              onTap: () {
                MyApp.of(context).delegate.push('screen3');
              },
              child: const Text('Screen3'),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:navigator/main_router.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Screen1'),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).pushNamed('screen2');

                MyApp.of(context).delegate.push('screen2');
              },
              child: const Text('Screen2'),
            )
          ],
        ),
      ),
    );
  }
}

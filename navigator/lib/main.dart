import 'package:flutter/material.dart';
import 'package:navigator/page/screen1.dart';
import 'package:navigator/page/screen2.dart';
import 'package:navigator/page/screen3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        'screen1': (_) => const Screen1(),
        'screen2': (_) => const Screen2(),
        'screen3': (_) => const Screen3(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                // 1. 指定 pageRoute
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const Screen1()),
                );
                // 2. 配置 name routes
                // Navigator.of(context).pushNamed('screen1');
              },
              child: const Text('Screen1'),
            )
          ],
        ),
      ),
    );
  }
}

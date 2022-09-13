import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_summary/component/bottom_sheet/bottom_sheets.dart';
import 'package:flutter_summary/component/button/buttons.dart';
import 'package:flutter_summary/component/dialog/dialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textButtonTheme: TextButtonThemeData(
              style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
          ))),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: (settings) {
        if (settings.name == 'buttons') {
          return CupertinoPageRoute(builder: ((context) => const Buttons()));
        }
        if (settings.name == 'bottomSheets') {
          return CupertinoPageRoute(
              builder: ((context) => const BottomSheets()));
        }
        if (settings.name == 'dialogs') {
          return CupertinoPageRoute(builder: (context) => const Dialogs());
        }
      },
      navigatorObservers: [CustomObserver()],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

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
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('buttons');
              },
              child: const Text('button'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('bottomSheets');
              },
              child: const Text('bottomSheets'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('dialogs');
              },
              child: const Text('dialogs'),
            )
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CustomObserver extends NavigatorObserver {
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    print('remove: $route');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    print('pop: $route');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    print('push: $route');
  }
}

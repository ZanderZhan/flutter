import 'package:flutter/material.dart';
import 'package:navigator/router/delegate.dart';
import 'package:navigator/router/parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => AppState();

  static AppState of(BuildContext context) {
    return context.findRootAncestorStateOfType<AppState>()!;
  }
}

class AppState extends State<MyApp> {
  late final Delegate delegate;
  late final Parser parser;

  @override
  void initState() {
    super.initState();
    delegate = Delegate();
    parser = Parser();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      routeInformationParser: parser,
      routerDelegate: delegate,
    );
  }
}

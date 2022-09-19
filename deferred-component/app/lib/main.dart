import 'package:flutter/material.dart';
import 'package:lib_bussiness/database/initializer.dart';
import 'package:user/main.dart' as $user;
import 'package:user/page/users.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var database = DatabaseInitializer();

  // user
  database.registerCallback((appDatabase) {
    $user.init(appDatabase.userDao);
  });

  database.open();

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
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const UsersPage();
                }));
              },
              child: const Text('go to users'),
            )
          ],
        ),
      ),
    );
  }
}

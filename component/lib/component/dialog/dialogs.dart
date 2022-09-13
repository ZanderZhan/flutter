import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dialogs extends StatefulWidget {
  const Dialogs({Key? key}) : super(key: key);

  @override
  State<Dialogs> createState() => _DialogsState();
}

class _DialogsState extends State<Dialogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              showGeneralDialog(
                  context: context,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SimpleDialog(
                      title: Text('simple dialog'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Treasury department'),
                        ),
                        SimpleDialogOption(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('State department'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text('general dialog'),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: Text('Alert'),
                      actions: [
                        TextButton(onPressed: () {}, child: const Text('NO')),
                        TextButton(onPressed: () {}, child: const Text('YES')),
                      ],
                    );
                  });
            },
            child: const Text('alert dialog'),
          ),
          GestureDetector(
            onTap: () {
              showCupertinoDialog(
                  context: context,
                  builder: (_) {
                    return CupertinoAlertDialog(
                      title: Text('Alert'),
                      actions: [
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('NO'),
                        ),
                        CupertinoDialogAction(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('YES'),
                        ),
                      ],
                    );
                  });
            },
            child: const Text('cupertino dialog'),
          ),
          GestureDetector(
            onTap: () {
              showAboutDialog(context: context);
            },
            child: const Text('about dialog'),
          ),
        ],
      ),
    );
  }
}

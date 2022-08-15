import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// https://material.io/components/sheets-bottom

class BottomSheets extends StatefulWidget {
  const BottomSheets({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<BottomSheets> with TickerProviderStateMixin {
  bool _inTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(builder: (context, _) {
        return SizedBox(
          width: double.infinity,
          // color: Colors.green,
          child: Column(
            children: [
              OutlinedButton(
                onPressed: () {
                  showBottomSheet(
                      context: context,
                      backgroundColor: Colors.red,
                      enableDrag: true,
                      builder: (_) {
                        return const ListTile(
                          leading: Icon(Icons.share),
                          title: Text('Share'),
                        );
                      });
                },
                child: const Text('standard_bottom_sheet'),
              ),
              OutlinedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      // barrierColor: Colors.blue,
                      // isDismissible: false,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10), bottom: Radius.zero)),
                      // constraints:
                      //     const BoxConstraints(minHeight: 500, maxHeight: 1200),
                      transitionAnimationController: AnimationController(
                          vsync: this,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 200)),
                      builder: (_) {
                        return Wrap(
                          children: const [
                            ListTile(
                              leading: Icon(Icons.share),
                              title: Text('Share'),
                            ),
                            ListTile(
                              leading: Icon(Icons.link),
                              title: Text('Get link'),
                            ),
                            ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit name'),
                            ),
                            ListTile(
                              leading: Icon(Icons.delete),
                              title: Text('Delete collection'),
                            ),
                          ],
                        );
                      });
                },
                child: const Text('modal bottom_sheet'),
              ),
              OutlinedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        // backgroundColor: Colors.red,
                        constraints: const BoxConstraints(
                            maxWidth: double.infinity,
                            maxHeight: double.infinity),
                        builder: (_) {
                          return SizedBox(
                            width: double.infinity,
                            child: DraggableScrollableSheet(
                                expand: false,
                                snap: true,
                                snapSizes: [0.5, 1.0],
                                builder: (_, controller) {
                                  return NotificationListener<
                                      DraggableScrollableNotification>(
                                    onNotification: (notification) {
                                      print(
                                          'zander, ${notification.extent  }');
                                      setState(() {
                                        _inTop = notification.extent == 1.0;
                                      });
                                      return false;
                                    },
                                    child: SingleChildScrollView(
                                        controller: controller,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            if (_inTop) AppBar(),
                                            Text('content')
                                          ],
                                        )),
                                  );
                                }),
                          );
                          // return Container(height: 500, child: Text('content'),);
                        });
                  },
                  child: const Text('draggable bottom sheet')),
              OutlinedButton(
                  onPressed: () {
                    showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return CupertinoActionSheet(
                            title: const Text('title'),
                            message: const Text('message'),
                            actions: [
                              CupertinoActionSheetAction(
                                  onPressed: () {},
                                  child: const Text('sheet1')),
                              CupertinoActionSheetAction(
                                  onPressed: () {}, child: const Text('sheet2'))
                            ],
                            cancelButton: CupertinoActionSheetAction(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('cancel')),
                          );
                        });
                  },
                  child: const Text('cupertino action sheet')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('pop back')),
              const Text('1. 怎么支持抽屉 bottom sheet \n'
                  '2. 怎么支持非 dialog 类型的 modal bottom sheet \n'
                  '3. 多次调用 showBottomSheet 弹起的 scaffold 类型的 sheet，会导致导航后退要连续点多次抵消')
            ],
          ),
        );
      }),
      // bottomSheet: Container(child: const Text('sheet'),),
    );
  }
}

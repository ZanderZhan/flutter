import 'package:flutter/material.dart';
import 'package:navigator/page/screen1.dart';
import 'package:navigator/page/screen2.dart';
import 'package:navigator/page/screen3.dart';

class Delegate extends RouterDelegate<String> with PopNavigatorRouterDelegateMixin, ChangeNotifier {

  // 保存所有的页面路径
  List<String> paths = [];

  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  List<Page<dynamic>> get pages {
    var pages = <Page>[];
    for (var element in paths) {
      if (element == 'screen2') {
        pages.add(const MaterialPage(child: Screen2()));
      } else if (element == 'screen3') {
        pages.add(const MaterialPage(child: Screen3()));
      } else {
        pages.add(const MaterialPage(child: Screen1()));
      }
    }
    return pages;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: pages,
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        paths.removeLast();
        // notify 会触发 Router 的 rebuild。
        // Router 的 rebuild 会调用当前的 build 方法返回新的 Navigator。
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _key;

  @override
  String? get currentConfiguration => paths.isNotEmpty? paths.last : null;

  @override
  Future<void> setNewRoutePath(String configuration) async {
    // 系统行为触发的，会调用到这里。
    paths.add(configuration);
  }

  void push(String path) {
    paths.add(path);
    notifyListeners();
  }

}
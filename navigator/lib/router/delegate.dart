import 'package:flutter/material.dart';
import 'package:navigator/page/screen1.dart';
import 'package:navigator/page/screen2.dart';
import 'package:navigator/page/screen3.dart';

class Delegate extends RouterDelegate<String> with PopNavigatorRouterDelegateMixin, ChangeNotifier {

  List<String> paths = [];

  final GlobalKey<NavigatorState> _key = GlobalKey<NavigatorState>();

  List<Page<dynamic>> get pages {
    var pages = <Page>[];
    for (var element in paths) {
      if (element == 'screen2') {
        pages.add(const MaterialPage(child: Screen2()));
      } else if (element == 'screen3') {
        pages.add(const MaterialPage(child: Screen3()));
      }
      pages.add(const MaterialPage(child: Screen1()));
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
        notifyListeners();
        return true;
      },
    );
  }

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _key;


  @override
  String get currentConfiguration => paths.last;

  @override
  Future<void> setNewRoutePath(String configuration) async {
    paths.add(configuration);
  }

  void push(String path) {
    paths.add(path);
    notifyListeners();
  }

}
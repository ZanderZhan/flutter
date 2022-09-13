import 'package:flutter/cupertino.dart';

class Parser extends RouteInformationParser<String> {

  @override
  Future<String> parseRouteInformation(RouteInformation routeInformation) async {
    return routeInformation.location ?? '';
  }

  @override
  RouteInformation restoreRouteInformation(String configuration) {
    return RouteInformation(location: configuration);
  }
}
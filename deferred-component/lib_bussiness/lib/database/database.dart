import 'dart:async';
import 'package:lib_base/lib_base.dart';
import 'package:module_user_interface/main.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(
  version: 1,
  entities: [USer],
)
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}

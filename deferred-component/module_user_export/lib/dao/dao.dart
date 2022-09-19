import 'package:lib_base/lib_base.dart';
import 'package:module_user_interface/entity/user.dart';

@dao
abstract class UserDao {
  // 获取所有用户
  @Query('SELECT * FROM User')
  Stream<List<USer>> getUsers();

  @Query('SELECT * FROM User WHERE name = :name')
  Future<List<USer>> findUsers(String name);

  // 增加用户信息
  @insert
  Future<void> saveUser(USer user);
}

class IUser {
  IUser(this.dao);

  final UserDao dao;

}

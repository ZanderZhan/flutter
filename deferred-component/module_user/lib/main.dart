import 'package:lib_bussiness/singleton/singleton.dart';
import 'package:user/impl/user_impl.dart';
import 'package:module_user_interface/dao/dao.dart';

export 'package:user/page/users.dart';

void init(UserDao dao) {
  Singleton.single<IUser>(() => UserImpl(dao));
}

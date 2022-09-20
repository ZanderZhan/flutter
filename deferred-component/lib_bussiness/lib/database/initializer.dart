import 'database.dart';

typedef DatabaseCallback = void Function(AppDatabase database);

class DatabaseInitializer {
  final callbacks = <DatabaseCallback>[];

  void registerCallback(DatabaseCallback callback) {
    if (!callbacks.contains(callback)) {
      callbacks.add(callback);
    }
  }

  bool removeCallback(DatabaseCallback callback) {
    return callbacks.remove(callback);
  }

  void open() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    // 回调
    for (var callback in callbacks) {
      callback.call(database);
    }

    // 清除
    callbacks.clear();
  }
}

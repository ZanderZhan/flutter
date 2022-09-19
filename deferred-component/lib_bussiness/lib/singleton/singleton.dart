typedef InstanceBuilder<T> = T Function();

class Singleton {
  static final _instance = <dynamic, dynamic>{};
  static final _builders = <dynamic, InstanceBuilder<dynamic>>{};

  static single<T>(InstanceBuilder<T> builder) {
    _builders[T] = builder;
  }

  static T find<T>() {
    if (_instance.containsKey(T)) {
      return _instance[T];
    }
    var instance = _builders[T]!.call();
    _instance[T] = instance;
    return instance;
  }
}

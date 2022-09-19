import 'package:lib_base/lib_base.dart';

@entity
class USer {

  @PrimaryKey(autoGenerate: true)
  final int? id;

  final String name;

  final int age;

  const USer(this.id, this.name, this.age);
}

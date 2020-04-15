

import 'package:hive/hive.dart';
part 'employee.g.dart';

@HiveType(typeId: 1)
class Employee {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String hobby;

  Employee(this.name, this.hobby);


}
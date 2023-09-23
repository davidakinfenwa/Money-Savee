

import 'package:hive_flutter/hive_flutter.dart';

part 'create_activity_model.g.dart';

@HiveType(typeId: 1)
class Create extends HiveObject {
  @HiveField(0)
  String? name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  String? amount;
  @HiveField(3)
  DateTime? dateCreated;
  @HiveField(4)
  String? IN;
  Create(
    this.name,
    this.description,
    this.amount,
    this.IN,
    this.dateCreated
  );
}

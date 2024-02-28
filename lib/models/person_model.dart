// person_model.dart
import 'package:hive/hive.dart';

part 'person_model.g.dart';

@HiveType(typeId: 3)
class Person extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late int id;

  @HiveField(2)
  late List<Item> items;

  Person({required this.name, required this.id, required this.items});
}

@HiveType(typeId: 4)
class Item extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late double price;

  @HiveField(2)
  late String description;

  @HiveField(3)
  late bool isReceived;

  @HiveField(4)
  late DateTime createdDate;

  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.isReceived,
    required this.createdDate,
  });
}

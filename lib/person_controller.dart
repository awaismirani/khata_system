// person_controller.dart
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:khata_system/person_model.dart';

class PersonController extends GetxController {
  var persons = <Person>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadPersons();
  }

  Future<void> loadPersons() async {
    var box = await Hive.openBox<Person>('persons');
    persons.assignAll(box.values.toList());
  }

  Future<void> addPerson(String name, int id, List<Item> items) async {
    var box = await Hive.openBox<Person>('persons');
    await box.add(Person(name: name, id: id, items: items));
    loadPersons();
  }
  Future<void> removePerson(int index) async {
    var box = await Hive.openBox<Person>('persons');
    await box.deleteAt(index);
    loadPersons();
  }

  Future<void> addItemToPerson(Person person, Item newItem) async {
    var box = await Hive.openBox<Person>('persons');
    person.items.add(newItem);
    person.save();
    loadPersons();
  }

  Future<void> removeItemFromPerson(Person person, Item itemToRemove) async {
    var box = await Hive.openBox<Person>('persons');
    person.items.remove(itemToRemove);
    person.save();
    loadPersons();
  }
}

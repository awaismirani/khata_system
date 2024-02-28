// person_controller.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:khata_system/models/person_model.dart';

class PersonController extends GetxController {
  TextEditingController personNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemDescriptionController = TextEditingController();
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

  Future<void> addPerson() async {
    String name = personNameController.text.toString();
    int phone =  phoneController as int;
    if (name.isNotEmpty) {
      var box = await Hive.openBox<Person>('persons');
      await box.add(Person(
          name: name, items: [], id:phone));
      loadPersons();
      Get.back();
      phoneController.clear();
      personNameController.clear();    } else {
      Get.snackbar("Alert", 'Unkown Error Occured',);
    }
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

  Future<void> clearItemsFromPerson(Person person, Item itemToRemove) async {
    var box = await Hive.openBox<Person>('persons');
    person.items.clear();
    person.save();
    loadPersons();
  }
}

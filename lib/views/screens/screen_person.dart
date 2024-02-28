import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_system/views/screens/screen_add_person.dart';
import '../../controllers/person_controller.dart';
import '../../models/person_model.dart';
import '../layouts/item_person.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_sheet.dart';
import '../widgets/custum_input_field.dart';
import 'screen_person_detail.dart';

class ScreenPerson extends StatefulWidget {
  @override
  State<ScreenPerson> createState() => _ScreenPersonState();
}

class _ScreenPersonState extends State<ScreenPerson> {
  bool isUdhar = false;
  bool isPaid = false;
  final _textField1Controller = TextEditingController();
  final _textField2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    PersonController personController = Get.put(PersonController());
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
          onPressed: () {
            Get.to(ScreenAddPerson());
          },
          icon: Icon(Icons.add),
          label: Text(
            "Add Person",
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Khata System ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.menu_book_outlined,
              color: Colors.green,
              size: 25,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        return personController.persons.isEmpty
            ? Center(
          child: Text("No Data Yet"),
        )
            : ListView.separated(
          itemCount: personController.persons.length,
          itemBuilder: (BuildContext context, int index) {
            Person person = personController.persons[index];
            return ItemPerson(
              onTapDetail: () {
                Get.to(ScreenPersonDetail());
              },
              person: person,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 10,
            );
          },
        );
      }),
    );
  }
}

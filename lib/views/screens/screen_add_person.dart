import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_system/controllers/person_controller.dart';

import '../widgets/custom_button.dart';
import '../widgets/custum_input_field.dart';

class ScreenAddPerson extends StatelessWidget {
  const ScreenAddPerson({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var personController = Get.put(PersonController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomInputField(hint: 'Enter Name',
            prefix: Icon(Icons.person),
            controller: personController.phoneController,),
          CustomInputField(hint: 'Enter Phone',
            keyboardType: TextInputType.number,
            prefix: Icon(Icons.phone),),
          MyCustomButton(
            text: 'Add Person', loading: false, onTap: () {
            personController.addPerson();
            // Get.back();
          },),
        ],
      ),
    );
  }
}

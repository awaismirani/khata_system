import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../models/person_model.dart';
import '../layouts/item_khata_detail.dart';

class ScreenPersonDetail extends StatelessWidget {
   ScreenPersonDetail({Key? key}) : super(key: key);
Item item = Item(name: 'name', price: 123, description: 'description', isReceived: true, createdDate: DateTime.now());
Item item1 = Item(name: 'name', price: 123, description: 'description', isReceived: false, createdDate: DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.add),
          label: Text(
            "Add Items",
            style: TextStyle(fontWeight: FontWeight.w600),
          )),
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Person Name ",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemKhataDetail(item: item,),
          ItemKhataDetail(item: item1,),
        ],
      ),
    );
  }
}

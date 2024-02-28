import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_system/models/person_model.dart';
import 'package:intl/intl.dart';
import '../../main.dart';

class ItemKhataDetail extends StatelessWidget {
  Item item;

  ItemKhataDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: appColor.withOpacity(.2), offset: Offset(5, 3))
      ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                  fontSize: 16,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(item.description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  item.isReceived?Icon(
                    Icons.pending,
                    color: Colors.red,
                    size: 15,
                  ):Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 15,
                  ),
                  Text(
                    " 123",
                    style: TextStyle(color: item.isReceived?Colors.green:Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Text(
              DateFormat('dd/MM/yyyy').format(item.createdDate),
                style: TextStyle(
                    color: Colors.grey, fontSize: 12),
              ),
            ],
          )
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}

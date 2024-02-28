import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khata_system/models/person_model.dart';

import '../../../main.dart';

class ItemPerson extends StatelessWidget {
  Person person;
    VoidCallback? onTapDetail;
    ItemPerson({
      this.onTapDetail,required this.person
});
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
                  person.name.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  person.id.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,fontSize: 12,
                      overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          TextButton.icon(
            onPressed: onTapDetail,
            style: ButtonStyle(
                backgroundColor:
                    MaterialStatePropertyAll(appColor.withOpacity(.2))),
            icon: Icon(
              Icons.details_outlined,
              color: appColor,
              size: 15,
            ),
            label: Text(
              "Details",
              style: TextStyle(color: appColor),
            ),
          ),
        ],
      ),
    ).paddingOnly(bottom: 10);
  }
}

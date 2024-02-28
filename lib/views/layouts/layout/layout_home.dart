import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';

import 'item_date.dart';
import 'item_doses.dart';

class LayoutHome extends StatelessWidget {
  LayoutHome({Key? key}) : super(key: key);
  Color blackColor = Color(0xff000000);
  Color greyColor = Color(0xff9B9B9B);
  Color containerColorL = Color(0xffA5A6F6);

  BoxDecoration boxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.3),
          blurRadius: 6,
          offset: Offset(6, 4),
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          child: Image.asset('assets/images/profile.png'),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Welcome Kelly!',
                          style: TextStyle(
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/icons/icons.png',
                    height: 25,
                    width: 25,
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                    decoration: boxDecoration,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        fillColor: Colors.transparent,
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                        hintText: '  Search Nearby Pharmacy',
                        prefixIconConstraints:
                            BoxConstraints(maxHeight: 25, maxWidth: 25),
                        prefixIcon: Image.asset(
                          'assets/icons/search.png',
                          height: 25,
                          width: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      CustomChip('Set Reminder'),
                      CustomChip('Save Med'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomChip('Track Symptom'),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Today',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ItemDoses(
                    isCompleted: true,
                    medName: 'Aspirin',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ItemDoses(
                    isCompleted: false,
                    medName: 'Panadol',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Upcoming',
                        style:
                            TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      Text(
                        'View All',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: greyColor,
                            fontSize: 13),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                      return ItemDate();
                    }, separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(width: 10,);
                    }, itemCount: 3,),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget CustomChip(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: boxDecoration,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(Icons.add),
        ],
      ),
    );
  }
}

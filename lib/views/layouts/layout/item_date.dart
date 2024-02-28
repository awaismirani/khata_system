import 'package:flutter/material.dart';

class ItemDate extends StatelessWidget {
   ItemDate({Key? key}) : super(key: key);
  Color containerColorL = Color(0xffA5A6F6);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: containerColorL,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'M',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
                Text(
                  '20',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '15:00 PM',
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 24),
              ),
              Text(
                'Ascard',
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 15),
              ),
              Text(
                '2:00 PM, 2 Pills',
                style: TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

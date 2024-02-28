import 'package:flutter/material.dart';

class ItemDoses extends StatelessWidget {
  bool isCompleted;
  String medName;
  ItemDoses({
    required this.medName,
    required this.isCompleted
});
  Color containerColorD = Color(0xff7879F1);
  Color containerColorL = Color(0xffA5A6F6);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      decoration: BoxDecoration(
        color: isCompleted?containerColorL:containerColorD,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            isCompleted?'assets/icons/calendarFill.png':'assets/icons/calendar.png',
            height: 20,
            width: 20,
          ),
          SizedBox(width: 6,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(medName,style: TextStyle(
                    fontSize: 15,fontWeight: FontWeight.w500
                ),),
                Row(
                  children: [
                    Text('2:00 PM, 2 Pills',style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.w500
                    ),),
                    SizedBox(width: 6,),
                    Icon(Icons.circle,size: 5,),
                    SizedBox(width: 4,),
                    Text(isCompleted?'Completed':'Skipped',style: TextStyle(
                        fontSize: 13,fontWeight: FontWeight.w500
                    ),),
                  ],
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios,size: 20,),

        ],
      ),
    );
  }
}

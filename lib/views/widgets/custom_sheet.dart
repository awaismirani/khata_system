import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  BuildContext cnt;
  MyBottomSheet({required this.cnt});
  @override
  _MyBottomSheetState createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  bool isUdhar = false;
  bool isPaid = false;

  final _textField1Controller = TextEditingController();
  final _textField2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {}, // Handle bottom sheet closing behavior here
      builder: (cnt) => Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _textField1Controller,
              decoration: InputDecoration(
                labelText: 'TextField 1',
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _textField2Controller,
              decoration: InputDecoration(
                labelText: 'TextField 2',
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ToggleButtons are preferred for exclusive options
                ToggleButtons(
                  isSelected: [isUdhar, isPaid],
                  onPressed: (index) {
                    setState(() {
                      if (index == 0) {
                        isUdhar = !isUdhar;
                        isPaid = false; // Ensure only one toggle is active
                      } else {
                        isPaid = !isPaid;
                        isUdhar = false;
                      }
                    });
                  },
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Udhar'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Paid'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

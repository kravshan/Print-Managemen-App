import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PreRow extends StatelessWidget {
  final TextEditingController paperType = TextEditingController();
  final TextEditingController rmsPkt = TextEditingController();
  final TextEditingController unitPrice = TextEditingController();

  final Function addNewPreRow;

  PreRow(this.addNewPreRow);

  void submitNewPreRow(BuildContext context) {
    final enteredpaperType = paperType.text;
    final enteredrmsPkt = double.parse(rmsPkt.text);
    final enteredunitPrice = double.parse(unitPrice.text);
    final qt = enteredrmsPkt * enteredunitPrice;

    if (enteredpaperType.isEmpty ||
        enteredrmsPkt <= 0 ||
        enteredunitPrice <= 0) {
      return;
    }
    addNewPreRow(enteredpaperType, enteredrmsPkt, enteredunitPrice, qt);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 8.h, 8.w, 4.h),
                      child: Text(
                        'Paper/ Board/ Sticker/ Special Paper',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.h),
                      height: 44.h,
                      width: 310.w,
                      color: Colors.white,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: paperType,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 8.h, 8.w, 4.h),
                      child: Text(
                        'RMS/ PKT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.h),
                      height: 44.h,
                      width: 310.w,
                      color: Colors.white,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: rmsPkt,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(4, 8.h, 8.w, 4.h),
                      child: Text(
                        'Unit Price',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.h),
                      height: 44.h,
                      width: 310.w,
                      color: Colors.white,
                      child: TextField(
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: unitPrice,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
              ],
            ),
            SizedBox(
              height: 25.h,
            ),
            SizedBox(
              width: 200.w,
              height: 55.h,
              child: RaisedButton(
                onPressed: () => submitNewPreRow(context),
                child: Text(
                  'ADD',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500),
                ),
                color: const Color.fromARGB(255, 185, 140, 62),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(57)),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:excel/excel.dart';

import '../Services/summary_of_entered_details.dart';
import '../Services/summary_of_pre.dart';
import '../Services/summary_of_pre2.dart';
import '../Services/pre2_summary.dart';
import '../Services/backgound.dart';
import '../Services/logo_bar.dart';

class Summary extends StatelessWidget {
  final Pre2Summary finalSummary;

  Summary(this.finalSummary);

  void exportExcel() {
    final excel = Excel.createExcel();
    final sheet = excel[excel.getDefaultSheet()!];

    final paperCost = finalSummary.summaryTwo.preResult;
    final workCost = finalSummary.resultpre2;
    final totalCost = paperCost + workCost;

    int j = 0;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 0)).value =
        'Details';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 1)).value =
        'Datee';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 2)).value =
        'Quotation No.';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 3)).value =
        'Client Name';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 4)).value =
        'Job Description';

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 6)).value =
        'Paper Cost';
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: 7)).value =
        'Paper/ Board/ Sticker/ Special Paper';

    int i1 = 0;
    for (j = 8; j < (finalSummary.summaryTwo.preRowSummary.length + 8); j++) {
      for (i1; i1 < finalSummary.summaryTwo.preRowSummary.length; i1++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j))
            .value = finalSummary.summaryTwo.preRowSummary[i1]['Paper Type'];
        print(finalSummary.summaryTwo.preRowSummary[i1]['Paper Type']);
        break;
      }
      i1++;
    }

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 4))
        .value = 'Work Cost';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 6))
        .value = 'Type Setting';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 7))
        .value = 'Photography';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 8))
        .value = 'Design';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 9))
        .value = 'Proofing';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: j + 10))
        .value = 'Translations';

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1)).value =
        finalSummary.summaryTwo.summaryOne.date;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 2)).value =
        finalSummary.summaryTwo.summaryOne.quoation;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 3)).value =
        finalSummary.summaryTwo.summaryOne.clientName;
    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 4)).value =
        finalSummary.summaryTwo.summaryOne.job;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 7)).value =
        'RMS/PKT';

    late int i2 = 0;
    for (j = 8; j < (finalSummary.summaryTwo.preRowSummary.length + 8); j++) {
      for (i2; i2 < finalSummary.summaryTwo.preRowSummary.length; i2++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j))
            .value = finalSummary.summaryTwo.preRowSummary[i2]['RMS/PKT'];
        break;
      }
      i2++;
    }

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 5))
        .value = 'Units';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 6))
        .value = finalSummary.typuni;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 7))
        .value = finalSummary.potouni;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 8))
        .value = finalSummary.desuni;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 9))
        .value = finalSummary.profuni;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 10))
        .value = finalSummary.trauni;

    sheet.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: 7)).value =
        'Unit Price';

    late int i3 = 0;
    for (j = 8; j < (finalSummary.summaryTwo.preRowSummary.length + 8); j++) {
      for (i3; i3 < finalSummary.summaryTwo.preRowSummary.length; i3++) {
        sheet
            .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j))
            .value = finalSummary.summaryTwo.preRowSummary[i3]['Unit Price'];
        break;
      }
      i3++;
    }

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 5))
        .value = 'Unit Price';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 6))
        .value = finalSummary.typuniprce;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 7))
        .value = finalSummary.potouniprce;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 8))
        .value = finalSummary.desuniprce;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 9))
        .value = finalSummary.profuniprce;
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 10))
        .value = finalSummary.trauniprce;

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 2))
        .value = 'Total Paper Cost';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 2))
        .value = paperCost;

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 12))
        .value = 'Total Work Cost';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 12))
        .value = workCost;

    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: j + 14))
        .value = 'Total Cost';
    sheet
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: j + 14))
        .value = totalCost;

    var file = excel.save(
        fileName: '${finalSummary.summaryTwo.summaryOne.quoation}.xlsx');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Background(),
        const LogoBar(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 170.h, 0, 80.h),
                  height: 700.h,
                  width: 1350.w,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.75),
                      borderRadius: BorderRadius.circular(40.r)),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Summary',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SummaryOfEnteredDetails(
                            finalSummary.summaryTwo.summaryOne.date,
                            finalSummary.summaryTwo.summaryOne.quoation,
                            finalSummary.summaryTwo.summaryOne.clientName,
                            finalSummary.summaryTwo.summaryOne.job,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SummaryOfPre(
                              finalSummary.summaryTwo.preRowSummary,
                              finalSummary.summaryTwo.preResult),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SummaryOfPre2(
                            desuni: finalSummary.desuni,
                            desuniprce: finalSummary.desuniprce,
                            potouni: finalSummary.potouni,
                            potouniprce: finalSummary.potouniprce,
                            profuni: finalSummary.profuni,
                            profuniprce: finalSummary.profuniprce,
                            trauni: finalSummary.trauni,
                            trauniprce: finalSummary.trauniprce,
                            typuni: finalSummary.typuni,
                            typuniprce: finalSummary.typuniprce,
                            qty1: finalSummary.qty1,
                            qty2: finalSummary.qty2,
                            qty3: finalSummary.qty3,
                            qty4: finalSummary.qty4,
                            qty5: finalSummary.qty5,
                            resultpre2: finalSummary.resultpre2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.all(16.sp),
                      width: 250.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Back',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57.r)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.sp),
                      width: 250.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {
                          exportExcel();
                        },
                        child: Text(
                          'Export to Excel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57.r)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(16.sp),
                      width: 250.w,
                      height: 63.h,
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        color: const Color.fromARGB(255, 185, 140, 62),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(57.r)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

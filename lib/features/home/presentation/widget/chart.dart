// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/utility/utility.dart';
import '../../data/model/create_activity_model.dart';

class Chart extends StatefulWidget {
  final int indexx;
  const Chart({
    Key? key,
     required this.indexx,
  }) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<Create>? a;
  bool b = true;
  bool j = true;
  @override
  Widget build(BuildContext context) {
    switch (widget.indexx) {
      case 0:
        a = today();
        b = true;
        j = true;
        break;
      case 1:
        a = week();
        b = false;
        j = true;
        break;
      case 2:
        a = month();
        b = false;
        j = true;
        break;
      case 3:
        a = year();
        //b = false;
        j = false;
        break;
      default:
    }
    return SizedBox(
      height: 300.h,
      width: double.infinity,
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        series: <SplineSeries<SalesData, String>>[
          SplineSeries<SalesData, String>(
              color: const Color.fromARGB(255, 47, 125, 121),
              width: 3.w,
              dataSource: <SalesData>[
                ...List.generate(timeer(a!, b?true : false).length, (index) {
                  return SalesData(
                      j
                          ? b
                              ? a![index].dateCreated!.hour.toString()
                              : a![index].dateCreated!.day.toString()
                          : a![index].dateCreated!.month.toString(),
                      b
                          ? index > 0
                              ? timeer(a!, true)[index] +
                                  timeer(a!, true)[index - 1]
                              : timeer(a!, true)[index]
                          : index > 0
                              ? timeer(a!, false)[index] +
                                  timeer(a!, false)[index - 1]
                              : timeer(a!, false)[index]);
                }),
              ],
              xValueMapper: (SalesData sales, _) => sales.year,
              yValueMapper: (SalesData sales, _) => sales.sales)
        ],
      ),
    );
  }
}

class SalesData {
  String year;
  int sales;
  SalesData(
    this.year,
    this.sales,
  );
}

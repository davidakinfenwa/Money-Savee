import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_saver/core/constant/constant.dart';
import 'package:money_saver/features/home/presentation/screen/add_item.dart';
import 'package:money_saver/features/home/presentation/screen/home.dart';
import 'package:money_saver/features/home/presentation/screen/statistic.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int indexCount = 0;
  List screen = [
    const Home(),
    const StatisticPage(),
    const Home(),
    const StatisticPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen[indexCount],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddItem()));
        },
        backgroundColor: CustomTypography.kDashboardColor,
        //elevation: 0,
        child: const Icon(
          Icons.add,
          color: ColorTheme.kWhiteColor,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  setState(() {
                    indexCount = 0;
                  });
                },
                child: Icon(
                  Icons.home,
                  size: 30.h,
                  color: indexCount == 0
                      ? CustomTypography.kDashboardColor
                      : ColorTheme.kGreyColor,
                )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    indexCount = 1;
                  });
                },
                child: Icon(
                  Icons.bar_chart_outlined,
                  size: 30.h,
                  color: indexCount == 1
                      ? CustomTypography.kDashboardColor
                      : ColorTheme.kGreyColor,
                )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    indexCount = 2;
                  });
                },
                child: Icon(
                  Icons.account_balance_outlined,
                  size: 30.h,
                  color: indexCount == 2
                      ? CustomTypography.kDashboardColor
                      : ColorTheme.kGreyColor,
                )),
            GestureDetector(
                onTap: () {
                  setState(() {
                    indexCount = 3;
                  });
                },
                child: Icon(
                  Icons.person_2_outlined,
                  size: 30.h,
                  color: indexCount == 3
                      ? CustomTypography.kDashboardColor
                      : ColorTheme.kGreyColor,
                )),
          ],
        ),
      ),
    );
  }
}

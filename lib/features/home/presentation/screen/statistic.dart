import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_saver/core/constant/constant.dart';
import 'package:money_saver/features/home/data/model/create_activity_model.dart';

import '../../../../core/utility/utility.dart';

import '../widget/chart.dart';

class StatisticPage extends StatefulWidget {
  const StatisticPage({super.key});

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List durationFunction = [today(), week(), month(), year()];
  List<Create> a = [];
  int index_color = 0;
  final ValueNotifier _notifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
              valueListenable: _notifier,
              builder: (context, value, child) {
                a = durationFunction[value];
                return statisticWidget();
              })),
    );
  }

  CustomScrollView statisticWidget() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Statistic',
              style: TextStyle(
                  color: ColorTheme.kBlackColor,
                  fontSize: 18.h,
                  fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ...List.generate(day.length, (index) {
                    return _buildDuration(index);
                  })
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    width: 120.w,
                    height: 40.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 2),
                        borderRadius: BorderRadius.circular(8)),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Expenses',
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_downward,
                          color: Colors.grey,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
             Chart(indexx: index_color),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Spending",
                    style: TextStyle(
                        color: ColorTheme.kBlackColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.h),
                  ),
                  Icon(Icons.swap_vert,
                      color: ColorTheme.kBlackColor_54, size: 18.h),
                ],
              ),
            )
          ]),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assests/images/imagee.png',
                height: 30.h,
              ),
            ),
            title: Text(a[index].name!,
                style: TextStyle(
                    // color: ColorTheme.kBlackColor_54,
                    fontWeight: FontWeight.w400,
                    fontSize: 14.h)),
            subtitle: Text(
                ' ${a[index].dateCreated!.year} ${a[index].dateCreated!.day}-${a[index].dateCreated!.month} - ${a[index].IN}',
                style: TextStyle(
                    // color: ColorTheme.kBlackColor_54,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.h)),
            trailing: Text(
                a[index].IN == "Income"
                    ? ' + \$ ${a[index].amount!}'
                    : ' - \$ ${a[index].amount!}',
                style: TextStyle(
                    color: a[index].IN == "Income" ? Colors.teal : Colors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.h)),
          );
        }, childCount: a.length))
      ],
    );
  }

  Widget _buildDuration(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          index_color = index;
          _notifier.value = index;
        });
      },
      child: Container(
        alignment: Alignment.center,
        height: 40.h,
        width: 80.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: index_color == index
                ? const Color.fromARGB(255, 47, 125, 121)
                : ColorTheme.kTransparentColor),
        child: Text(day[index],
            style: TextStyle(
                color: index_color == index
                    ? ColorTheme.kWhiteColor
                    : ColorTheme.kBlackColor,
                fontSize: 14.h,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}

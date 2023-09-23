

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/core/constant/constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:money_saver/features/home/data/model/create_activity_model.dart';

import '../../../../core/utility/utility.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final box = Hive.box<Create>('data');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ValueListenableBuilder(
        builder: (context, value, child) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 290.h, child: _headerSection()),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Sizing.kSizingMultiple * 1.5.w,
                      vertical: Sizing.kSizingMultiple.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Transcation Details",
                        style: TextStyle(
                            color: ColorTheme.kBlackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18.h),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                            color: ColorTheme.kBlackColor_54,
                            fontWeight: FontWeight.w500,
                            fontSize: 14.h),
                      ),
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final history = box.values.toList()[index];
                  // if(history.isDefinedAndNotNull) {
                  //   return Center(child: Text('no data found'),);
                  // }

                  return _buildDimisalTrascation(history, index);
                }, childCount: box.length),
              )
            ],
          );
        },
        valueListenable: box.listenable(),
      )),
    );
  }

  // Widget _buildEnptyTransaction(){
  //   return const SliverFillRemaining(
  //     child: Text('No item found'),
  //   );
  // }

  ListTile _showTranscation(int index, Create history) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          'assests/images/imagee.png',
          height: 30.h,
        ),
      ),
      title: Text(history.name!,
          style: TextStyle(
              // color: ColorTheme.kBlackColor_54,
              fontWeight: FontWeight.w400,
              fontSize: 14.h)),
      subtitle: Text(
          ' ${history.dateCreated!.year} ${history.dateCreated!.day}-${history.dateCreated!.month} - ${history.IN}',
          style: TextStyle(
              // color: ColorTheme.kBlackColor_54,
              fontWeight: FontWeight.w300,
              fontSize: 12.h)),
      trailing: Text(
          history.IN == "Income"
              ? ' + \$ ${history.amount!}'
              : ' - \$ ${history.amount!}',
          style: TextStyle(
              color: history.IN == "Income" ? Colors.teal : Colors.red,
              fontWeight: FontWeight.w500,
              fontSize: 16.h)),
    );
  }

  Widget _buildDimisalTrascation(Create history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: _showTranscation(index, history));
  }

  Widget _headerSection() {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: Sizing.kDashboardHeight.h,
              decoration: BoxDecoration(
                  color: CustomTypography.kDashboardColor,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(Sizing.kSizingMultiple * 2.3),
                      bottomRight:
                          Radius.circular(Sizing.kSizingMultiple * 2.3))),
              child: Stack(
                children: [
                  Positioned(
                    top: Sizing.kSizingMultiple * 1.5,
                    right: Sizing.kSizingMultiple * 1.5,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(Sizing.kSizingMultiple),
                      child: Container(
                        color: const Color.fromRGBO(250, 250, 250, 0.1),
                        height: Sizing.kSizingMultiple * 5,
                        width: Sizing.kSizingMultiple * 5,
                        child: const Icon(
                          Icons.notification_add_outlined,
                          size: Sizing.kSizingMultiple * 4,
                          color: ColorTheme.kWhiteColor,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: Sizing.kSizingMultiple * 1.5,
                      left: Sizing.kSizingMultiple * 1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Good Morning',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 224, 223, 223),
                                fontWeight: FontWeight.w500,
                                fontSize: 20.h),
                          ),
                          Text(
                            ' Akinfenwa David',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 224, 223, 223),
                                fontWeight: FontWeight.w600,
                                fontSize: 24.h),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 100.h,
          left: 20.w,
          child: Container(
            height: Sizing.kStackedDashboardHeight,
            width: Sizing.kStackedDashboardWidth,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 47, 125, 121),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(47, 125, 121, 0.5),
                      offset: Offset(0, 6),
                      blurRadius: 20,
                      spreadRadius: 6)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' Total Balance',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              fontWeight: FontWeight.w600,
                              fontSize: 20.h),
                        ),
                        const Icon(
                          Icons.more_horiz,
                          color: ColorTheme.kWhiteColor,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          ' \$ ${total()}',
                          style: TextStyle(
                              color: const Color.fromARGB(255, 224, 223, 223),
                              fontWeight: FontWeight.w600,
                              fontSize: 25.h),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.h),
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 85, 145, 141),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_downward,
                                    color: ColorTheme.kWhiteColor,
                                    size: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Income',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 216, 216, 216),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.h),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50.h),
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 85, 145, 141),
                                  ),
                                  child: const Icon(
                                    Icons.arrow_upward,
                                    color: ColorTheme.kWhiteColor,
                                    size: 16,
                                  )),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Expenses',
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 216, 216, 216),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.h),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            ' \$ ${income()}',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 224, 223, 223),
                                fontWeight: FontWeight.w600,
                                fontSize: 17.h),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            ' \$ ${expense()}',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 224, 223, 223),
                                fontWeight: FontWeight.w600,
                                fontSize: 17.h),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}

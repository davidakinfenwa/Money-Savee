import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:money_saver/core/constant/constant.dart';

import '../../data/model/create_activity_model.dart';

class AddItem extends StatefulWidget {
  const AddItem({super.key});

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  final box = Hive.box<Create>('data');
  DateTime date = DateTime.now();
  String? selectedItem;
  String? selectedItemType;
  final TextEditingController description = TextEditingController();
  FocusNode desc = FocusNode();
  final TextEditingController amount = TextEditingController();
  FocusNode amt = FocusNode();
  final List<String> items = [
    "Food",
    "Transfer",
    "Transportation",
    "Education"
  ];
  final List<String> itemsType = [
    "Income",
    "Expense",
  ];
  @override
  void initState() {
    desc.addListener(() {
      setState(() {});
    });
    amt.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [backgroundContainer(context), mainContainer()],
      )),
    );
  }

  Positioned mainContainer() {
    return Positioned(
      bottom: 80.h,
      // left: 10.w,
      child: Container(
        height: 500.h,
        width: 340.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.w),
            color: ColorTheme.kWhiteColor,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(.2, .2),
                  color: ColorTheme.kDashboardColor,
                  blurRadius: 0.2,
                  spreadRadius: .4,
                  blurStyle: BlurStyle.normal),
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              dropdownItem(),
              SizedBox(
                height: 20.h,
              ),
              descriptionField(),
              SizedBox(
                height: 20.h,
              ),
              amountField(),
              SizedBox(
                height: 20.h,
              ),
              dropdownItemForType(),
              SizedBox(
                height: 20.h,
              ),
              dateField(),
              const Spacer(),
              saveButton(),
              SizedBox(
                height: 20.h,
              )

              //
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton saveButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: CustomTypography.kDashboardColor,
            animationDuration: const Duration(milliseconds: 100),
            elevation: 5,
            disabledBackgroundColor: Colors.red),
        onPressed: () {
          var add = Create(selectedItem, description.text, amount.text,
              selectedItemType, date);
          box.add(add);
          Navigator.of(context).pop();
        },
        child: Container(
          width: 120.w,
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.w),
            //color: CustomTypography.kDashboardColor
          ),
          child: Text(
            "Save",
            style: TextStyle(color: ColorTheme.kWhiteColor, fontSize: 18.h),
          ),
        ));
  }

  Container dateField() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(width: 2, color: const Color(0xffc5c5c5))),
      width: 350.w,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == null) return;
            setState(() {
              date = newDate;
              print(date);
            });
        },
        child: Text(
          'Date : ${date.year} - ${date.month} - ${date.day}',
          style: TextStyle(fontSize: 15.h, color: ColorTheme.kBlackColor),
        ),
      ),
    );
  }

  TextField descriptionField() {
    return TextField(
      focusNode: desc,
      controller: description,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        labelText: 'Enter description',
        labelStyle: TextStyle(color: ColorTheme.kGreyColorLight),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 2.w, color: const Color(0xFFC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(
                width: 2.w, color: CustomTypography.kDashboardColor)),
      ),
    );
  }

  TextField amountField() {
    return TextField(
      focusNode: amt,
      controller: amount,
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        labelText: 'Enter Amount',
        labelStyle: TextStyle(color: ColorTheme.kGreyColorLight),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(width: 2.w, color: const Color(0xFFC5C5C5))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.w),
            borderSide: BorderSide(
                width: 2.w, color: CustomTypography.kDashboardColor)),
      ),
    );
  }

  Container dropdownItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: ColorTheme.kGreyColorLight)),
      child: DropdownButton<String>(
        value: selectedItem,
        items: items
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(children: [
                  Image.asset("assests/images/imagee.png"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    e,
                    style: TextStyle(fontSize: 18.h),
                  )
                ]),
              ),
            )
            .toList(),
        selectedItemBuilder: (BuildContext context) => items
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: Image.asset("assests/images/imagee.png"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(e)
                  ],
                ))
            .toList(),
        hint: const Text(
          "Select a item",
          style: TextStyle(color: ColorTheme.kGreyColor),
        ),
        dropdownColor: ColorTheme.kWhiteColor,
        isExpanded: true,
        underline: Container(),
        onChanged: ((value) {
          setState(() {
            selectedItem = value!;
          });
        }),
      ),
    );
  }

  Container dropdownItemForType() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      width: 350.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: ColorTheme.kGreyColorLight)),
      child: DropdownButton<String>(
        value: selectedItemType,
        items: itemsType
            .map(
              (e) => DropdownMenuItem(
                value: e,
                child: Row(children: [
                  Image.asset("assests/images/imagee.png"),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    e.toLowerCase(),
                    style: TextStyle(fontSize: 18.h),
                  )
                ]),
              ),
            )
            .toList(),
        selectedItemBuilder: (BuildContext context) => itemsType
            .map((e) => Row(
                  children: [
                    SizedBox(
                      width: 42.w,
                      child: Image.asset("assests/images/imagee.png"),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(e)
                  ],
                ))
            .toList(),
        hint: const Text(
          "Select a type",
          style: TextStyle(color: ColorTheme.kGreyColor),
        ),
        dropdownColor: ColorTheme.kWhiteColor,
        isExpanded: true,
        underline: Container(),
        onChanged: ((value) {
          setState(() {
            selectedItemType = value!;
          });
        }),
      ),
    );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 200.h,
          decoration: BoxDecoration(
            color: CustomTypography.kDashboardColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50.w),
              bottomRight: Radius.circular(50.w),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      hoverColor: Colors.red,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: ColorTheme.kWhiteColor,
                      ),
                    ),
                    Text(
                      'Add Item',
                      style: TextStyle(
                          fontSize: 20.h,
                          fontWeight: FontWeight.w600,
                          color: ColorTheme.kWhiteColor),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: ColorTheme.kWhiteColor,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

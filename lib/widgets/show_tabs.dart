import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ShowTabs extends StatefulWidget {
  final String firstName;
  final String secondName;

  const ShowTabs({
    Key? key,
    required this.firstName,
    required this.secondName,
  }) : super(key: key);

  @override
  State<ShowTabs> createState() => _ShowTabsState();
}

class _ShowTabsState extends State<ShowTabs> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 43.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                width: 0.6,
                color: selectedIndex == 0
                    ? Colors.transparent
                    : Colors.transparent,
              ),
              surfaceTintColor: Colors.transparent,
              backgroundColor:
                  selectedIndex == 0 ? Colors.lightGreen : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.firstName,
            ),
          ),
        ),
        SizedBox(
          width: 43.w,
          height: 6.h,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            style: ElevatedButton.styleFrom(
              side: BorderSide(
                width: 0.6,
                color: selectedIndex == 1
                    ? Colors.transparent
                    : Colors.transparent,
              ),
              surfaceTintColor: Colors.transparent,
              backgroundColor:
                  selectedIndex == 1 ? Colors.lightGreen : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              widget.secondName,
            ),
          ),
        ),
      ],
    );
  }
}

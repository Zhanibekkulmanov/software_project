import 'package:flutter/material.dart';
import 'package:software_project/core/const/color_styles.dart';
import 'package:software_project/core/const/textStyles_const.dart';

class ScheduleBox extends StatefulWidget {
  final String name;
  const ScheduleBox({Key? key, required this.name}) : super(key: key);

  @override
  _ScheduleBoxState createState() => _ScheduleBoxState();
}

class _ScheduleBoxState extends State<ScheduleBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      color: ColorStyles.greyPageColor,
        child: Center(
          child: Text(
            widget.name,
            style: TextStyles.blueMainRegularStyle.copyWith(fontSize: 24,color: ColorStyles.blackColor),
          ),
        ),
    );
  }
}

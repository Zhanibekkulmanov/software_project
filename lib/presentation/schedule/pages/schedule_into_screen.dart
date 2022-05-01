import 'package:flutter/material.dart';
import 'package:software_project/core/const/color_styles.dart';

class ScheduleInto extends StatefulWidget {
  final String name1 ;
  const ScheduleInto({Key? key,required this.name1}) : super(key: key);

  @override
  _ScheduleIntoState createState() => _ScheduleIntoState();
}

class _ScheduleIntoState extends State<ScheduleInto> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorStyles.whiteColor,
      child: Text(widget.name1),
    );
  }
}

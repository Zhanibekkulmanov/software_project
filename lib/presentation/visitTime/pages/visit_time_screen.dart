import 'package:flutter/material.dart';

class VisitTime extends StatefulWidget {
  const VisitTime({Key? key}) : super(key: key);

  @override
  _VisitTimeState createState() => _VisitTimeState();
}

class _VisitTimeState extends State<VisitTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "visittime"
        ),
      ),
    );
  }
}

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
      child: Center(
          child: Column(children: <Widget>[
            SizedBox(height: 20,),
            Text(widget.name1,style: TextStyle(
              fontSize: 40
            ).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none),),
            Padding(
              padding: const EdgeInsets.only(top: 50),
                child: Table(
                  defaultColumnWidth: FixedColumnWidth(180.0),
                  border: TableBorder.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 2),
                  children: [
                    TableRow(children: [
                      Column(children:[Text('Time', style: TextStyle(fontSize: 20.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                      Column(children:[Text('Work', style: TextStyle(fontSize: 20.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('08:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('09:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('10:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('11:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('12:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('13:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('14:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('15:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('16:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('17:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                    TableRow( children: [
                      Column(children:[Text('18:00',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none)),]),
                      Column(children:[Text('',style: TextStyle(fontSize: 25.0).copyWith(color: ColorStyles.blackColor,decoration: TextDecoration.none))]),
                    ]),
                  ],
                ),
              ),
          ])
      ),
    );
  }
}

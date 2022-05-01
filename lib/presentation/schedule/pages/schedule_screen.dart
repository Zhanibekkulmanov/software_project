import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:software_project/presentation/schedule/pages/schedule_into_screen.dart';
import 'package:software_project/presentation/schedule/widgets/schedule_widget.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  @override
  Widget build(BuildContext context) {
    return
        Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 60,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Monday",)));
                  },
                  child: ScheduleBox(name: "Monday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Tuesday",)));
                  },
                  child: ScheduleBox(name: "Tuesday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Wednesday",)));
                  },
                  child: ScheduleBox(name: "Wednesday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Thursday",)));
                  },
                  child: ScheduleBox(name: "Thursday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Friday",)));
                  },
                  child: ScheduleBox(name: "Friday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Saturday",)));
                  },
                  child: ScheduleBox(name: "Saturday"),
                ),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScheduleInto(name1: "Sunday",)));
                  },
                  child: ScheduleBox(name: "Sunday"),
                ),
              ],
            ),
        );
  }
}

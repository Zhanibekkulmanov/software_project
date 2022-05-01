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
                const SizedBox(height: 60,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Monday",)));
                  },
                  child: const ScheduleBox(name: "Monday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Tuesday",)));
                  },
                  child: const ScheduleBox(name: "Tuesday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Wednesday",)));
                  },
                  child: const ScheduleBox(name: "Wednesday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Thursday",)));
                  },
                  child: const ScheduleBox(name: "Thursday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Friday",)));
                  },
                  child: const ScheduleBox(name: "Friday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Saturday",)));
                  },
                  child: const ScheduleBox(name: "Saturday"),
                ),
                const SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const ScheduleInto(name1: "Sunday",)));
                  },
                  child: const ScheduleBox(name: "Sunday"),
                ),
              ],
            ),
        );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/indjection_container.dart';
import '../../../logic/visitTime/bloc/visit_time_bloc.dart';

class VisitTime extends StatefulWidget {
  const VisitTime({Key? key}) : super(key: key);

  @override
  _VisitTimeState createState() => _VisitTimeState();
}

class _VisitTimeState extends State<VisitTime> {

  List show = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      sl<VisitTimeBloc>()
        ..add(VisitTimeLoad()),
      child: SafeArea(
        child: Container(
          child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 100,
                            child: Center(child: Text('DATE',
                              style: TextStyle(fontSize: 30),))
                        ),
                        Container(
                            width: 50,
                            child: Center(child: Text('IN',
                                style: TextStyle(fontSize: 30)))
                        ),
                        Container(
                            width: 70,
                            child: Center(child: Text('OUT',
                                style: TextStyle(fontSize: 30)))
                        ),
                      ],
                    ),
                  ),
                  BlocConsumer<VisitTimeBloc, VisitTimeState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if(state is VisitTimeSuccess) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: state.time.length,
                            itemBuilder: (context, index) {
                              show.add(false);
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16, 8, 16, 8),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          show[index] = !show[index];
                                        });
                                      },
                                      child: Container(
                                        decoration: new BoxDecoration(
                                            color: Colors.teal[200],
                                            //new Color.fromRGBO(255, 0, 0, 0.0),
                                            borderRadius: new BorderRadius.only(
                                                topLeft: const Radius.circular(
                                                    10.0),
                                                topRight: const Radius.circular(
                                                    10.0))
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text((index + 1).toString(),
                                                    style: TextStyle(
                                                        fontSize: 20),),
                                                  SizedBox(width: 4,),
                                                  Text('Aruzhan Iyembergenova',
                                                    style: TextStyle(
                                                        fontSize: 20),),
                                                  SizedBox(width: 4,),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    show[index] ? Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(state.time[index].dateIn,
                                                style: TextStyle(
                                                    fontSize: 20),),
                                              Text(state.time[index].timeIn == '' ? '' : state.time[index].timeIn.substring(0,5),
                                                style: TextStyle(
                                                    fontSize: 20),),
                                              Text(state.time[index].timeOut == '' ? '' : state.time[index].timeOut.substring(0,5),
                                                style: TextStyle(
                                                    fontSize: 20),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ) : Offstage()
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                      if(state is VisitTimeLoading){
                        return Column(
                          children: [
                            SizedBox(height: 300,),
                            Center(child: CupertinoActivityIndicator()),
                          ],
                        );
                      }
                      if(state is VisitTimeFailure){
                        print(state.message);
                      }
                      return Offstage();
                    },
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

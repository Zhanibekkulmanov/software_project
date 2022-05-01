import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:software_project/core/const/color_styles.dart';
import 'package:software_project/core/const/textStyles_const.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final Box tokensBox = Hive.box('tokens');

  @override
  Widget build(BuildContext context) {

    final Color background = ColorStyles.greyPageColor;
    final Color fill = ColorStyles.whiteColor;
    final List<Color> gradient = [
      background,
      background,
      fill,
      fill,
    ];
    final double fillPercent = 70.0; // fills 56.23% for container from bottom
    final double fillStop = (100 - fillPercent) / 100;
    final List<double> stops = [0.0, fillStop, fillStop, 1.0];

    return SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradient,
              stops: stops,
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16,top: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.settings,size: 30,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        tokensBox.get('name'),
                      style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 25,)
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius:80,
                      backgroundImage: NetworkImage('https://picsum.photos/250?image=9'),
                    )
                  ],
                ),
              ),
                Padding(
                  padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
                  child:Container(
                    color: ColorStyles.greyPageColor,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8),
                          child: Text(
                              "General Information",
                              style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 25,)
                          ),
                        )
                    ],
                  ),
                  ),
                ),
              SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "User ID: ${tokensBox.get('id')}",
                          style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                      ),
                      SizedBox(height: 16,),
                      Text(
                          "Birth Date: ${tokensBox.get('birth-date')}",
                          style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                      ),
                      SizedBox(height: 16,),
                      Text(
                          "Position: ${tokensBox.get('position')}",
                          style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                      ),
                      SizedBox(height: 16,),
                      // Text(
                      //     "Status: ",
                      //     style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                      // ),
                      // SizedBox(height: 16,),
                    ],
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 30,left: 25,right: 25),
                child:Container(
                  color: ColorStyles.greyPageColor,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12,top: 8,bottom: 8),
                        child: Text(
                            "Contacts",
                            style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 25,)
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16,),
                    Text(
                        "Phone number: ${tokensBox.get('phone')}",
                        style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                    ),
                    SizedBox(height: 16,),
                    Text(
                        "Email: ${tokensBox.get('gmail')}",
                        style: TextStyles.blueMainRegularStyle.copyWith(color: ColorStyles.blackColor,fontSize: 18,)
                    ),
                    SizedBox(height: 16,),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

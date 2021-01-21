import 'package:flutter/material.dart';
import 'package:Expenses_Tracker_App/ui/shared/app_colors.dart';

class AppDocker extends StatefulWidget {

  @override
  _AppDockerState createState() => _AppDockerState();
}

class _AppDockerState extends State<AppDocker> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex:_currentIndex,
      onTap: (value){
        _currentIndex=value;
        _currentIndex==0? Navigator.of(context).pushNamed("chart"): Navigator.of(context).pushNamed("reminder");
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.pie_chart,color: Colors.black,),title: Text('Thống kê',style: TextStyle(color: Colors.black),)),
        BottomNavigationBarItem(icon: Icon(Icons.notifications,color: Colors.black,),title: Text('Thông báo',style: TextStyle(color: Colors.black),)),
      ],
      backgroundColor: Colors.cyan[200],
    );
  }
}

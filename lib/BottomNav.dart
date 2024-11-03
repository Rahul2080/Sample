import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home.dart';
import 'Payment.dart';
import 'Profile.dart';

class Bottomnav extends StatefulWidget {
  const Bottomnav({super.key});

  @override
  State<Bottomnav> createState() => _BottomnavState();
}

class _BottomnavState extends State<Bottomnav> {
  final screens = [ Profile(),
    Payment(),

    Home(),
  ];
  int currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:

    Stack(
      children: [

        screens[currentindex],

        Padding(
          padding:  EdgeInsets.only(top: 860.h),
          child: Container(  width: 430.w,
            height: 77.h,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color:  Colors.blue[800]!.withOpacity(0.10000000149011612),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0C000000),
                  blurRadius: 6.25,
                  offset: Offset(0, 8.34),
                  spreadRadius: 0,
                )
              ],),
            child: BottomNavigationBar(
                backgroundColor:  Colors.blue[800],
                selectedItemColor: Colors.orange,
                showUnselectedLabels: true,
                unselectedItemColor: Colors.black,
                currentIndex: currentindex,
                onTap: (index) {
                  setState(() {
                    currentindex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group,size: 33.sp,
                        color: currentindex == 0 ?   Colors.white: Colors.grey),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.album_rounded,size: 33.sp,
                        color: currentindex == 1 ? Colors.white: Colors.grey,
                      ),
                      label: ''),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.maps_home_work_rounded,size: 33.sp,
                        color: currentindex == 2 ?   Colors.white : Colors.grey),
                    label: '',),
                ]),
          ),
        ),
      ],
    ),);
  }
}

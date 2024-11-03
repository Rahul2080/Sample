import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<bool> isOnList = List.generate(6, (index) => false);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      // Hide the button when scrolling down
      if (showCreatePlanButton) setState(() => showCreatePlanButton = false);
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      // Show the button when scrolling up
      if (!showCreatePlanButton) setState(() => showCreatePlanButton = true);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Color(0xFF07A0DA),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 35.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DaashFit',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 140.w,
                    height: 18.h,
                    child: Text(
                      'Stallion Gym Fitness',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 55.w,
              height: 55.h,
              padding: EdgeInsets.only(right: 2.47.w, bottom: 0.47.h),
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0C000000),
                    blurRadius: 6.25,
                    offset: Offset(0, 8.34),
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_drop_down_outlined,
                color: Color(0xFFD9D9D9),
                size: 36.sp,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color(0xFF2465B1),
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [Color(0xFF07A0DA), Color(0xFF2465B1)],
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 70.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildCard(Icons.houseboat_outlined, 'My Gym\nDetails'),
                              buildCard(Icons.contact_page, 'Account\nSettings'),
                            ],
                          ),
                          SizedBox(height: 50.h),
                          Center(
                            child: Text(
                              'Version 2.0.1',
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
                expandedHeight: 340.h,
                pinned: true,
                floating: false,
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Container(
                    width: 149.w,
                    height: 5.h,
                    decoration: ShapeDecoration(
                      color: Color(0xFFD9D9D9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.r),
                      ),
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(height: 20.h),
                        GestureDetector(
                          child: Container(
                            width: 370.w,
                            height: 134.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.r),
                              ),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x0C000000),
                                  blurRadius: 6.25,
                                  offset: Offset(0, 8.34),
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 5.h),
                                  Row(
                                    children: [
                                      Text(
                                        'Fit Flex Cardio Plan',
                                        style: GoogleFonts.inter(
                                          textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.sp,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 50.w),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isOnList[index] = !isOnList[index];
                                            });
                                          },
                                          child: Container(
                                            width: 74.w,
                                            height: 34.h,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20.r),
                                              color: isOnList[index] ? Colors.green : Colors.grey,
                                            ),
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: isOnList[index] ? 40 : 0,
                                                  child: AnimatedContainer(
                                                    duration: Duration(milliseconds: 200),
                                                    width: 30.w,
                                                    height: 30.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      shape: BoxShape.circle,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black26,
                                                          blurRadius: 4,
                                                          offset: Offset(2, 2),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Center(
                                                  child: Text(
                                                    isOnList[index] ? 'ON' : 'OFF',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '₹1500',
                                    style: GoogleFonts.inter(
                                      textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 331,
                                    height: 44,
                                    child: Text(
                                      'This plan gives you access to wide range of fit flex lrem ipsum lorem ipsum lorem lorem ipsum ispum......',
                                      style: GoogleFonts.inter(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        )
                      ],
                    );
                  },
                  childCount: isOnList.length,
                ),
              ),
            ],
          ),
          if (showCreatePlanButton)
            Positioned(
              bottom: 90.h,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 340.w,
                  height: 55.h,
                  padding: EdgeInsets.symmetric(horizontal: 64.w, vertical: 13.h),
                  decoration: ShapeDecoration(
                    gradient: RadialGradient(
                      center: Alignment(0, 1),
                      radius: 0,
                      colors: [Color(0xFFE08D0F), Color(0xFFDB6523)],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Create Plan',
                      style: GoogleFonts.inter(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Container buildCard(IconData icon, String title) {
    return Container(
      width: 159.w,
      height: 146.h,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 6.25,
            offset: Offset(0, 8.34),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 17.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: -38 * 3.1415926535897932 / 180,
                child: Icon(Icons.arrow_forward, color: Color(0xFFD9D9D9)),
              ),
            ),
            Icon(icon, color: Colors.white),
            Text(
              title,
              style: GoogleFonts.inter(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

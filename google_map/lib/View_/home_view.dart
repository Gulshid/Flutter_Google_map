import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.black, fontSize: 30.sp),),
        centerTitle: true,
      ),

      body: Center(child: Text('Home View Screen Page', style: TextStyle(color: Colors.black, fontSize: 30.sp),),),
    );
  }
}
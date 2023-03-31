import 'package:flutter/material.dart';
import 'package:pixwalz/views/widgets/catBlock.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:pixwalz/views/widgets/searchBar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: CustomAppBar(
          word1: 'Pix',
          word2: 'Walz',
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: SearchB(),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 9.h,
            width: 100.w,
            child: ListView.builder(
                itemCount: 20,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return CatB();
                }),
          )
        ],
      ),
    );
  }
}

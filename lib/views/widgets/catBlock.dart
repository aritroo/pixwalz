import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CatB extends StatelessWidget {
  const CatB({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              "https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
              height: 20.h,
              width: 40.w,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 20.h,
            width: 40.w,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          Positioned(
            left: 12.w,
            top: 2.h,
            child: Text(
              "Cars",
              style: TextStyle(
                color: Color.fromARGB(231, 255, 255, 255),
                fontWeight: FontWeight.w300,
                fontSize: 20.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

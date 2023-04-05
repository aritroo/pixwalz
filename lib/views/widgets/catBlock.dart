import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:pixwalz/views/screens/category.dart';

class CatB extends StatelessWidget {
  final String categoryName;
  final String categoryImgSrc;

  CatB({super.key, required this.categoryImgSrc, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryScreen(
                catImgUrl: categoryImgSrc, catName: categoryName),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                categoryImgSrc,
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
                categoryName,
                style: TextStyle(
                  color: Color.fromARGB(231, 255, 255, 255),
                  fontWeight: FontWeight.w300,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

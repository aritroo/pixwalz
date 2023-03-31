import 'package:flutter/material.dart';
import 'package:pixwalz/views/widgets/catBlock.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:pixwalz/views/widgets/searchBar.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  "https://images.pexels.com/photos/1535162/pexels-photo-1535162.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  height: 14.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                ),
                Container(
                  height: 14.h,
                  width: 100.w,
                  color: Colors.black38,
                ),
                Positioned(
                  left: 33.w,
                  top: 3.h,
                  child: Column(
                    children: [
                      Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Mountains',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 100.h,
              margin: EdgeInsets.symmetric(
                horizontal: 2.w,
              ),
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 40.h,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: 20,
                itemBuilder: ((context, index) => Container(
                      height: 14.h,
                      width: 30.w,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          "https://i.pinimg.com/736x/e6/f7/e8/e6f7e823c92d72aea836f3f6ffc30622.jpg",
                          // height: 20.h,
                          // width: 20.w,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

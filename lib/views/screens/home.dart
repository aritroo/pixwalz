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
        body: NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  floating: true,
                  // snap: true,
                  // pinned: true,
                  collapsedHeight: 22.h,
                  bottom: PreferredSize(
                      child: Column(
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
                          ),
                          SizedBox(
                            height: 2.h,
                          )
                        ],
                      ),
                      preferredSize: Size.fromHeight(0.h)),
                )
              ];
            },
            body: Container(
              height: 100.h,
              margin: EdgeInsets.only(bottom: 2.w, left: 2.w, right: 2.w),
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
            )));
  }
}

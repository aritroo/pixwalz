import 'package:flutter/material.dart';
import 'package:pixwalz/controller/apiControl.dart';
import 'package:pixwalz/models/photosModel.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:sizer/sizer.dart';

import 'fullScreen.dart';

class CategoryScreen extends StatefulWidget {
  final String catName;
  final String catImgUrl;

  CategoryScreen({super.key, required this.catImgUrl, required this.catName});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<PhotosModel> categoryResults = [];

  bool isLoading = true;

  GetCatRelWall() async {
    categoryResults = await ApiController.searchWallpapers(widget.catName);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    GetCatRelWall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   elevation: 0.0,
      //   centerTitle: true,
      //   title: CustomAppBar(
      //     word1: 'Pix',
      //     word2: 'Walz',
      //   ),
      //   automaticallyImplyLeading: false,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back),
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : NestedScrollView(
              floatHeaderSlivers: true,
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    backgroundColor: Colors.white,
                    floating: true,
                    centerTitle: true,
                    elevation: 0.0,
                    title: CustomAppBar(
                      word1: 'Pix',
                      word2: 'Walz',
                    ),
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                      color: Colors.black,
                    ),
                    // snap: true,
                    // pinned: true,
                    collapsedHeight: 21.h,
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(0.h),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Image.network(
                                widget.catImgUrl,
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
                                left: 42.w,
                                top: 4.h,
                                child: Column(
                                  children: [
                                    Text(
                                      widget.catName,
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
                        ],
                      ),
                    ),
                  ),
                ];
              },
              body: Container(
                height: 100.h,
                margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                child: GridView.builder(
                  padding: EdgeInsets.only(top: 1.h),
                  physics: BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 40.h,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categoryResults.length,
                  itemBuilder: ((context, index) => GridTile(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FullScreen(
                                  imgUrl: categoryResults[index].imgSrc,
                                ),
                              ),
                            );
                          },
                          child: Hero(
                            tag: categoryResults[index].imgSrc,
                            child: Container(
                              height: 14.h,
                              width: 30.w,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  categoryResults[index].imgSrc,
                                  // height: 20.h,
                                  // width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )),
                ),
              ),
            ),
    );
  }
}

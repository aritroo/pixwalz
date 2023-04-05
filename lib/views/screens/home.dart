import 'package:flutter/material.dart';
import 'package:pixwalz/controller/apiControl.dart';
import 'package:pixwalz/models/categoryModel.dart';
import 'package:pixwalz/models/photosModel.dart';
import 'package:pixwalz/views/screens/fullScreen.dart';
import 'package:pixwalz/views/widgets/catBlock.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:pixwalz/views/widgets/searchBar.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotosModel> trendingWallList = [];
  List<CategoryModel> CatModList = [];
  bool isLoading = true;

  GetCatDetails() async {
    CatModList = await ApiController.getCategoriesList();
    print("Getting Cat Mod List");
    print(CatModList);
    setState(() {
      CatModList = CatModList;
    });
  }

  GetTrendingWallpapers() async {
    trendingWallList = await ApiController.getTrendingWallpapers();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetCatDetails();
    GetTrendingWallpapers();
  }

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
                                itemCount: CatModList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: ((context, index) => CatB(
                                      categoryImgSrc:
                                          CatModList[index].catImgUrl,
                                      categoryName: CatModList[index].catName,
                                    )),
                              ),
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
                child: RefreshIndicator(
                  onRefresh: () async {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  },
                  child: GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: 40.h,
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: trendingWallList.length,
                    itemBuilder: ((context, index) => GridTile(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreen(
                                    imgUrl: trendingWallList[index].imgSrc,
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: trendingWallList[index].imgSrc,
                              child: Container(
                                height: 14.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                  color: Colors.amberAccent,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    trendingWallList[index].imgSrc,
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
            ),
    );
  }
}

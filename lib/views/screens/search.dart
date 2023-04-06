import 'package:flutter/material.dart';
import 'package:pixwalz/controller/apiControl.dart';
import 'package:pixwalz/models/photosModel.dart';
import 'package:pixwalz/views/screens/fullScreen.dart';
import 'package:pixwalz/views/widgets/customAppBar.dart';
import 'package:pixwalz/views/widgets/searchBar.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatefulWidget {
  final String query;
  SearchScreen({super.key, required this.query});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PhotosModel> searchResults = [];
  bool isLoading = true;

  GetSearchResults() async {
    searchResults = await ApiController.searchWallpapers(widget.query);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    GetSearchResults();
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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: SearchB(),
                  ),
                  SizedBox(
                    height: 2.h,
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
                      itemCount: searchResults.length,
                      itemBuilder: ((context, index) => GridTile(
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => FullScreen(
                                        imgUrl: searchResults[index].imgSrc),
                                  ),
                                );
                              },
                              child: Hero(
                                tag: searchResults[index].imgSrc,
                                child: Container(
                                  height: 14.h,
                                  width: 30.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      searchResults[index].imgSrc,
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
                  )
                ],
              ),
            ),
    );
  }
}

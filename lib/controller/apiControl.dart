import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:pixwalz/models/categoryModel.dart';
import 'package:pixwalz/models/photosModel.dart';

class ApiController {
  static List<PhotosModel> trendingWallpapers = [];
  static List<PhotosModel> searchWallpapersList = [];
  static List<CategoryModel> categoryModelList = [];

  static String _apiKey =
      "gTq0yXfUcvMBmANNS1bwyuWU6xdFXjWyrlApEHTPwdxk6kZqoxHYTVad";

  static Future<List<PhotosModel>> getTrendingWallpapers() async {
    await http.get(Uri.parse("https://api.pexels.com/v1/curated"),
        headers: {"Authorization": "$_apiKey"}).then((value) {
      print("RESPONSE REPORT");
      print(value.body);
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      photos.forEach((element) {
        trendingWallpapers.add(PhotosModel.fromAPI2App(element));
      });
    });
    return trendingWallpapers;
  }

  static Future<List<PhotosModel>> searchWallpapers(String query) async {
    await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&per_page=30&page=1"),
        headers: {"Authorization": "$_apiKey"}).then((value) {
      Map<String, dynamic> jsonData = jsonDecode(value.body);
      List photos = jsonData['photos'];
      searchWallpapersList.clear();
      photos.forEach((element) {
        searchWallpapersList.add(PhotosModel.fromAPI2App(element));
      });
    });
    return searchWallpapersList;
  }

  static List<CategoryModel> getCategoriesList() {
    List categoryName = [
      "Cars",
      "Nature",
      "Bikes",
      "Street",
      "City",
      "Flowers"
    ];

    categoryModelList.clear();
    categoryName.forEach((catName) async {
      final _random = new Random();
      PhotosModel photoModel =
          (await searchWallpapers(catName))[0 + _random.nextInt(11 - 0)];
      print("IMG SRC IS HERE");
      print(photoModel.imgSrc);
      categoryModelList
          .add(CategoryModel(catImgUrl: photoModel.imgSrc, catName: catName));
    });
    return categoryModelList;
  }
}

import 'package:flutter/material.dart';

import 'package:sizer/sizer.dart';

class FullScreen extends StatelessWidget {
  final String imgUrl;
  FullScreen({super.key, required this.imgUrl});

  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  // Future<void> setWallpaperFromFile(
  //     String wallpaperUrl, BuildContext context) async {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text("Downloading Started..."),
  //     ),
  //   );

  //   try {
  //     var imageId = await ImageDownloader.downloadImage(wallpaperUrl);

  //     // ignore: unnecessary_null_comparison
  //     if (imageId == null) {
  //       return;
  //     }
  //     // Below is a method of obtaining saved image information.

  //     var fileName = await ImageDownloader.findName(imageId);
  //     var path = await ImageDownloader.findPath(imageId);
  //     var size = await ImageDownloader.findByteSize(imageId);
  //     var mimeType = await ImageDownloader.findMimeType(imageId);

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Downloaded Successfully"),
  //         action: SnackBarAction(
  //           label: "Open",
  //           onPressed: () {
  //             OpenFile.open(path);
  //           },
  //         ),
  //       ),
  //     );

  //     print("IMAGE DOWNLOADED");
  //   } on PlatformException catch (error) {
  //     print(error);
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text("Error Occured - $error"),
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

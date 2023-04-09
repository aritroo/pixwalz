import 'dart:math';
import 'dart:typed_data';

import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class FullScreen extends StatefulWidget {
  final String imgUrl;

  FullScreen({super.key, required this.imgUrl});

  @override
  State<FullScreen> createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  late bool _isLoading;
  late String _localPath;

  @override
  void initState() {
    super.initState();
    _isLoading = false;
    _localPath = '';
  }

  Future<bool> _requestStoragePermission() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      status = await Permission.storage.request();
    }
    return status.isGranted;
  }

  Future<void> _saveImage() async {
    setState(() {
      _isLoading = true;
    });

    var response = await Dio().get(
      widget.imgUrl,
      options: Options(responseType: ResponseType.bytes),
    );
    Random random = new Random();
    final result = await ImageGallerySaver.saveImage(
      Uint8List.fromList(response.data),
      quality: 100,
      name: 'Pixwalz' + random.nextInt(5000).toString(),
    );
    if (result['isSuccess']) {
      setState(() {
        _localPath = result['filePath'];
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _setWallpaper() async {
    setState(() {
      _isLoading = true;
    });

    var response = await Dio().get(
      widget.imgUrl,
      options: Options(responseType: ResponseType.bytes),
    );

    final result = await AsyncWallpaper.setWallpaper(
      url: _localPath,
      wallpaperLocation: AsyncWallpaper.HOME_SCREEN,
      toastDetails: ToastDetails.success(),
      errorToastDetails: ToastDetails.error(),
      goToHome: false,
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _isLoading
          ? CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: _saveImage,
                  child: Icon(Icons.download),
                ),
                SizedBox(
                  width: 3.w,
                ),
                FloatingActionButton(
                  onPressed: _setWallpaper,
                  child: Icon(Icons.wallpaper),
                ),
              ],
            ),
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.imgUrl),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

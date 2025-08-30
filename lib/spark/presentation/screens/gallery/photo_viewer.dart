import 'package:zone/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewer extends StatefulWidget {
  PhotoViewer({super.key, required this.galleryItems, required this.page});

  PageController pageController = PageController();
  List<String?> galleryItems = <String?>[];
  int page = 0;

  @override
  State<PhotoViewer> createState() => _PhotoViewerState();
}

class _PhotoViewerState extends State<PhotoViewer> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.pageController.jumpToPage(widget.page);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderWidget(
        title: 'Photo Viewer',
        titleFontSize: 20,
        appBarHeight: 60,
        titleFontWeight: FontWeight.bold,
        textColor: Colors.black,
        backgroundColor: Colors.black,
        backButtonBackgroundColor: Colors.black,
        isBack: true,
      ),
      body: Container(
          child: PhotoViewGallery.builder(
        pageController: widget.pageController,
        scrollPhysics: const BouncingScrollPhysics(),
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: NetworkImage(widget.galleryItems[index]!),
            initialScale: PhotoViewComputedScale.contained * 0.8,
            heroAttributes:
                PhotoViewHeroAttributes(tag: widget.galleryItems[index]!),
          );
        },
        itemCount: widget.galleryItems.length,
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0,
            height: 20.0,
            child: CircularProgressIndicator(),
          ),
        ),
      )),
    );
  }
}

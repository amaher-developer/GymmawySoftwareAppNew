import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
    Key? key,
    required this.imageLink,
    required this.onErrorWidget,
    this.fit,
    this.width,
    this.height,
  }) : super(key: key);

  final String imageLink;
  final Widget onErrorWidget;
  final BoxFit? fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageLink,
      fit: fit ?? BoxFit.fill,
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      placeholder: (context, url) => ClipRRect(
        borderRadius: BorderRadius.circular(25),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ),
      errorWidget: (context, url, error) => onErrorWidget,
    );
  }
}

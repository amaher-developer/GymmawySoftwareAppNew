import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: child,
    );
    /*
        return Shimmer.fromColors(
      baseColor: LightColors.primary,
      highlightColor: LightColors.primary.withOpacity(0.4),
      child: child,
    );
    */
  }
}

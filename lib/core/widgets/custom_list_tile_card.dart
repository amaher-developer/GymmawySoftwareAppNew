import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListTileCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? leading;
  final Widget? trailing;
  final Widget? title;
  final Widget? subTitle;
  final VoidCallback? onTap;

  const CustomListTileCard(
      {Key? key,
      this.width,
      this.height,
      this.leading,
      this.trailing,
      this.onTap,
      this.title,
      this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border:
                    Border.all(color: Colors.grey.withOpacity(.3), width: 2),
              ),
              height: height ?? .15.sh,
              width: width ?? .9.sw,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  leading != null
                      ? leading!
                      : SizedBox(
                          width: 78.w,
                        ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ...children(),
                        const Spacer(),
                        trailing != null
                            ? trailing!
                            : SizedBox(
                                width: 78.w,
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            PositionedDirectional(
              start: 0,
              top: .0200.sh,
              child: Container(
                height: .11.sh,
                width: 5,
                decoration: const BoxDecoration(
                    color: Color(0XFFF97D04),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(2),
                      bottomLeft: Radius.circular(2),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> children() {
    List<Widget> widgets = [];
    if (title != null || subTitle != null) {
      // Create a column for the title and subtitle
      widgets.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // Align items to the start
          children: [
            if (title != null) title!,
            SizedBox(
              height: 5.h,
            ),
            if (subTitle != null) subTitle!,
          ],
        ),
      );
    }
    return widgets;
  }
}

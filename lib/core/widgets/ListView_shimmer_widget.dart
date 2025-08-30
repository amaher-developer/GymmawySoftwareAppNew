import 'package:zone/core/managers/color_manager.dart';
import 'package:zone/core/widgets/shimmer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewLoadingWidget extends StatelessWidget {
  const ListViewLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.7.sh,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        itemCount: 30,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext ctx, index) {
          return ShimmerWidget(
            child: Row(
              children: [
/*                Container(
                  margin: EdgeInsets.only(
                    bottom: 15.h,
                  ),
                  height: 60.r,
                  width: 60.r,
                  decoration: BoxDecoration(
                    color: LightColors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),*/
                /*         SizedBox(
                  width: 20.w,
                ),*/
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      bottom: 15.h,
                    ),
                    height: 120.h,
                    decoration: BoxDecoration(
                      color: LightColors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

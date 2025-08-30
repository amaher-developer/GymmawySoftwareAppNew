import 'package:zone/core/managers/strings_assets_constants.dart';
import 'package:zone/spark/presentation/screens/profile/widget/table_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/managers/color_manager.dart';

class ProfileTableWidget extends StatelessWidget {
  const ProfileTableWidget({
    super.key,
    this.amountPaid,
    this.amountRemaining,
    this.endDate,
    this.startDate,
    this.attendance,
    this.membershipStatus,
    this.freezeCheck,
  });

  final String? amountPaid;
  final String? amountRemaining;
  final String? endDate;
  final String? startDate;
  final String? attendance;
  final String? membershipStatus;
  final int? freezeCheck;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: .36.sh,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: VerticalDivider(
              color: LightColors.primary.withOpacity(.5),
              thickness: 1,
              endIndent: 10,
            ),
          ),
          Positioned(
            top: .1.sh,
            left: .1.sw,
            child: SizedBox(
              width: .8.sw,
              child: Divider(
                color: LightColors.primary.withOpacity(.5),
                thickness: 1,
              ),
            ),
          ),
          Positioned(
            top: .22.sh,
            left: .1.sw,
            child: SizedBox(
              width: .8.sw,
              child: Divider(
                color: LightColors.primary.withOpacity(.5),
                thickness: 1,
              ),
            ),
          ),
          ...ProfileTableRowWidget(
            cell1Title: StringsAssetsConstants.end_date,
            cell1Value: endDate ?? '-',
            cell2Title: StringsAssetsConstants.join_date,
            cell2Value: startDate ?? '-',
          ),
          ...ProfileTableRowWidget(
            top: .12.sh,
            cell1Title: StringsAssetsConstants.remaining_amount,
            cell1Value: amountRemaining ?? '-',
            cell2Title: StringsAssetsConstants.paid_amount,
            cell2Value: amountPaid ?? '-',
          ),
          ...ProfileTableRowWidget(
            top: .24.sh,
            cell1Title: StringsAssetsConstants.attendance_times,
            cell1Value: attendance ?? '-',
            cell2Title: StringsAssetsConstants.membership_status,
            cell2Value: membershipStatus ?? '-',
          ),
        ],
      ),
    );
  }
}
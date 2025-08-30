import 'package:zone/spark/presentation/screens/profile/widget/table_cell_widget.dart';
import 'package:flutter/material.dart';

List<Widget> ProfileTableRowWidget(
    {double? top,
    required String cell1Title,
    required String cell1Value,
    required String cell2Title,
    required String cell2Value}) {
  return [
    ProfileTableCellWidget(
      leftCell: true,
      top: top,
      cellTitle: cell1Title,
      cellValue: cell1Value,
    ),
    ProfileTableCellWidget(
      leftCell: false,
      top: top,
      cellTitle: cell2Title,
      cellValue: cell2Value,
    ),
  ];
}

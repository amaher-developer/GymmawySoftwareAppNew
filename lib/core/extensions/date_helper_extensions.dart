import 'package:flutter/material.dart';

extension Extra on DateTime {
  bool isToday() {
    var t = DateTime.now();
    return t.year == year && t.month == month && t.day == day;
  }

  bool isTomorrow() {
    var t = DateTime.now().add(const Duration(days: 1));
    return t.year == year && t.month == month && t.day == day;
  }

  String dateOnly() {
    return "$year-$month-$day";
  }

  String timeOnly() {
    return "$hour:$minute";
  }
}

extension ExtraOnNull on DateTime? {
  String timeOnlyText() {
    var show = (this is DateTime);
    if (show) {
      TimeOfDay time = TimeOfDay(hour: this!.hour, minute: this!.minute);
      return time.toText();
    }
    return "";
  }

  String get dateOnlyText {
    var show = (this is DateTime);
    return show ? "${this!.year}-${this!.month}-${this!.day}" : "";
  }
}

extension TimeOfDayConverter on TimeOfDay {
  String toText() {
    int h = hour;
    int m = minute;
    if (h > 12) h = h - 12;
    return "$h:$m ${period.name}".toUpperCase();
  }
}

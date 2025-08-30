import 'package:flutter/material.dart';

// serverKey
const serverKey =
    'AAAALridMzo:APA91bGMgn1Ezd2ZcwgYPHiLSvquoXgj7S2ZN4Fh7INQs6K3nrcCQxBfYhBrZ8aZa36ZxSeArRQE9fiUb2ZN5e5MDoU-wd_DqtgMSve4biCDRcoEZWN6OO1PHh_5Tk96UhPWg4h1rxtz';
const kNetworkImageOnErrorWidget = ColoredBox(
  color: kShimmerBaseColor,
  child: SizedBox(
    child: Icon(
      Icons.error_outline,
      color: Colors.red,
    ),
  ),
);

// Colors.grey[100] as Color(0x) object

const kShimmerBaseColor = Color(0xFFE0E0E0);
const kAndroidVersion = '1.0.1';
const kIosVersion = '1.0.1';

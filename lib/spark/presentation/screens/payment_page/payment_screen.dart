import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zone/core/extensions/translation_extinsions.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../core/consts/text_styles.dart';
import '../../../../core/managers/color_manager.dart';
import '../../../../core/managers/strings_assets_constants.dart';
import '../../../../core/widgets/rounded_container.dart';


class PaymentScreen extends StatefulWidget {
  final String initialUrl;

  const PaymentScreen({Key? key, required this.initialUrl}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late WebViewController _controller;


  @override
  void initState() {

    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
            String? text = change.url;

            // if (text != null && text.toLowerCase().contains("invoice")){
            //   Navigator.of(context).pop();
            //     Fluttertoast.showToast(
            //         msg: "Payment completed successfully".translated,
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.CENTER,
            //         timeInSecForIosWeb: 1,
            //         textColor: Colors.white,
            //         fontSize: 16.0
            //     );
            // } else {
            //   print("Text does not contain the word 'invoice'.");
            // }
          },

          // onNavigationRequest: (NavigationRequest request) {
          //   if (request.url.startsWith(widget.initialUrl)) {
          //     return NavigationDecision.prevent;
          //   }
          //   return NavigationDecision.navigate;
          // },

        ),
      )
      ..loadRequest(Uri.parse(widget.initialUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Row(
          children: [
            Text(StringsAssetsConstants.payment),
            const Spacer(),
            CloseButton(
              color: Colors.black,
              onPressed: () {
                  Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}



class PaymentButton extends StatelessWidget {
  final String url;
  final String token;

  const PaymentButton({
    super.key,
    required this.url,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    String urlWithToken = '$url?token=$token';

    return RoundedContainer(
      width: 0.33.sw,
      borderWidth: 1.3.r,
      radius: 12.r,
      constraints: BoxConstraints(maxHeight: 50.h),
      onTapped: ()  {
        Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  PaymentScreen(initialUrl: urlWithToken),
                  ),
                );
      },
      alignment: Alignment.center,
      child: Text(
        StringsAssetsConstants.payment,
        style: AppTextStyle.white_19.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:url_launcher/url_launcher.dart';

class ServerMessaging {
/*  static void sendMessage() async {
    try {
      http.Response response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode(
          <String, dynamic>{
            'notification': <String, dynamic>{
              'body': messageBody,
              'title': messageTitle
            },
            'priority': 'high',
            'data': <String, dynamic>{
              'click_action': 'FLUTTER_NOTIFICATION_CLICK',
              'id': '1',
              'status': 'done'
            },
            'to': '/topics/stream',
          },
        ),
      );
      log("res ${response.statusCode}");
    } catch (e) {
      print("error push notification");
    }
  }*/

  static void onTerminatedMessageSent({required Function callBack}) async {
    var message = await FirebaseMessaging.instance.getInitialMessage();
    if (message != null) {
      print('messageUrl: ${message.data}');
      if (message.data.isNotEmpty &&
          message.data.containsKey('url') &&
          message.data['url'] != null) {
        launchUrl(Uri.parse(message.data['url']));
        callBack();

        message.data.forEach((key, value) {
          print('key: $key, value: $value');
        });
        callBack();
      }
    }
    callBack();
  }

  static void onBackGroundMessagingSent({required Function callBack}) async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('messageUrl: ${message.data}');
      if (message.data.isNotEmpty &&
          message.data.containsKey('url') &&
          message.data['url'] != null) {
        launchUrl(Uri.parse(message.data['url']));
        callBack();

        message.data.forEach((key, value) {
          print('key: $key, value: $value');
        });
        callBack();
      }
    });
  }

  static void onForeGroundMessagingSent({required Function callBack}) async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      callBack();
    });
  }
}

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hog/data/providers/casheProvider/cashe_provider.dart';

Future<void> handleBackgroundMessage(RemoteMessage? message) async {}
Future<void> handlemessage(RemoteMessage? message) async {}

class FireBaseAPi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    debugPrint(fcmToken);
    CacheProvider.setdeviceToken(fcmToken);
    initpushnotification();
  }

  static Future initpushnotification() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    await FirebaseMessaging.instance.getInitialMessage().then((value) {
      FirebaseMessaging.onMessageOpenedApp.listen(handlemessage);
      FirebaseMessaging.onBackgroundMessage(handlemessage);
      FirebaseMessaging.onMessage.listen((event) {});
    });
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Get/pages/packagelist.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelShowBadge: true,
        importance: NotificationImportance.Max,
        channelKey: "basic channel",
        channelName: "basic notification",
        channelDescription: "description")
  ],
  debug: true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      home:packagelist(),
    );
  }
}

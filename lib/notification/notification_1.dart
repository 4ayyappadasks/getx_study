import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class notificaton1 extends StatefulWidget { 
  const notificaton1({Key? key}) : super(key: key);

  @override
  State<notificaton1> createState() => _notificaton1State();
}

class _notificaton1State extends State<notificaton1> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((value) {
      if(!value)
        {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(
        child: ElevatedButton(onPressed: (){
          triggernotification();
        }, child: Text("get notification"))),);
  }
}

void triggernotification() {
  AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: "basic channel",
      title: "njan paraula",
      body: "Simple"));
}

import 'package:covid/models/notificationModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NotificationProvider extends ChangeNotifier{

  NotificationModel notificationData;

  Future getNotificationData(context) async {

    var response = await http.get('https://api.rootnet.in/covid19-in/notifications');

    var jsonParsed = json.decode(response.body);

    this.notificationData = NotificationModel.fromJson(jsonParsed);
    this.notifyListeners();
  }
}
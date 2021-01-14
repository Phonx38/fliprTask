import 'package:covid/models/regional.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContactProvider extends ChangeNotifier{
  MyData myData;


  Future getData(context) async {
    var response = await http.get('https://api.rootnet.in/covid19-in/contacts');
    var jsonParsed = json.decode(response.body);

    this.myData = MyData.fromJson(jsonParsed);
    this.notifyListeners();


  }
}
import 'package:covid/models/TotalConfirmedModel.dart';
import 'package:covid/models/TotalSampleModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class ChartProvider extends ChangeNotifier {
  TotalConfirmedModel confirmedData;
  TotalSampledModel sampledData;


  Future getConfirmedData(context) async {
    var response = await http.get('https://api.rootnet.in/covid19-in/stats/history');
    var jsonParsed = json.decode(response.body);

    this.confirmedData = TotalConfirmedModel.fromJson(jsonParsed);
    this.notifyListeners();


  }

  Future getSampledData(context) async {
    var response = await http.get('https://api.rootnet.in/covid19-in/stats/testing/history');
    var jsonParsed = json.decode(response.body);

    this.sampledData = TotalSampledModel.fromJson(jsonParsed);
    this.notifyListeners();


  }
}
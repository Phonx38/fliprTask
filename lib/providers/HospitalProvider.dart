import 'package:covid/models/HospitalModel.dart';
import 'package:covid/models/regional.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HospitalProvider extends ChangeNotifier {
  HospitalModel hospitalData;

  

  String url = 'https://api.rootnet.in/covid19-in/hospitals/beds';

  Future getHospitalData(context) async {
    var response = await http.get(url);
    var jsonParsed = json.decode(response.body);

    this.hospitalData = HospitalModel.fromJson(jsonParsed);

    this.notifyListeners();
  }
  
   List getTotal() {
    if (hospitalData.data.regional != null) {
      var ruralHospitalTotal = 0;
      var ruralBedTotal = 0;
      var urbanHospitalTotal = 0;
      var urbanBedTotal = 0;
      var totalHospitalTotal = 0;
      var totalHospitalBedTotal = 0;
      for (int i = 0; i < hospitalData.data.regional.length; i++) {
        ruralHospitalTotal +=hospitalData.data.regional[i].ruralHospitals;
        ruralBedTotal += hospitalData.data.regional[i].ruralBeds;
        urbanHospitalTotal += hospitalData.data.regional[i].urbanHospitals;
        urbanBedTotal += hospitalData.data.regional[i].urbanBeds;
        totalHospitalTotal += hospitalData.data.regional[i].totalHospitals;
        totalHospitalBedTotal +=hospitalData.data.regional[i].totalBeds;

      }
      return [ruralHospitalTotal,ruralBedTotal,urbanHospitalTotal,urbanBedTotal,totalHospitalTotal,totalHospitalBedTotal];
    }
  }
}

class TotalSampledModel {
  bool success;
  List<Data> data;
  String lastRefreshed;
  String lastOriginUpdate;

  TotalSampledModel(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  TotalSampledModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    lastRefreshed = json['lastRefreshed'];
    lastOriginUpdate = json['lastOriginUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['lastRefreshed'] = this.lastRefreshed;
    data['lastOriginUpdate'] = this.lastOriginUpdate;
    return data;
  }
}

class Data {
  String day;
  int totalSamplesTested;
  int totalIndividualsTested;
  int totalPositiveCases;
  String source;

  Data(
      {this.day,
      this.totalSamplesTested,
      this.totalIndividualsTested,
      this.totalPositiveCases,
      this.source});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    totalSamplesTested = json['totalSamplesTested'];
    totalIndividualsTested = json['totalIndividualsTested'];
    totalPositiveCases = json['totalPositiveCases'];
    source = json['source'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['totalSamplesTested'] = this.totalSamplesTested;
    data['totalIndividualsTested'] = this.totalIndividualsTested;
    data['totalPositiveCases'] = this.totalPositiveCases;
    data['source'] = this.source;
    return data;
  }
}
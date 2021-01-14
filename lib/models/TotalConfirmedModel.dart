class TotalConfirmedModel {
  bool success;
  List<Data> data;
  String lastRefreshed;
  String lastOriginUpdate;

  TotalConfirmedModel(
      {this.success, this.data, this.lastRefreshed, this.lastOriginUpdate});

  TotalConfirmedModel.fromJson(Map<String, dynamic> json) {
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
  Summary summary;
  List<Regional> regional;

  Data({this.day, this.summary, this.regional});

  Data.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['regional'] != null) {
      regional = new List<Regional>();
      json['regional'].forEach((v) {
        regional.add(new Regional.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.summary != null) {
      data['summary'] = this.summary.toJson();
    }
    if (this.regional != null) {
      data['regional'] = this.regional.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int total;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int confirmedButLocationUnidentified;

  Summary(
      {this.total,
      this.confirmedCasesIndian,
      this.confirmedCasesForeign,
      this.discharged,
      this.deaths,
      this.confirmedButLocationUnidentified});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    confirmedCasesIndian = json['confirmedCasesIndian'];
    confirmedCasesForeign = json['confirmedCasesForeign'];
    discharged = json['discharged'];
    deaths = json['deaths'];
    confirmedButLocationUnidentified = json['confirmedButLocationUnidentified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    data['confirmedButLocationUnidentified'] =
        this.confirmedButLocationUnidentified;
    return data;
  }
}

class Regional {
  String loc;
  int confirmedCasesIndian;
  int confirmedCasesForeign;
  int discharged;
  int deaths;
  int totalConfirmed;

  Regional(
      {this.loc,
      this.confirmedCasesIndian,
      this.confirmedCasesForeign,
      this.discharged,
      this.deaths,
      this.totalConfirmed});

  Regional.fromJson(Map<String, dynamic> json) {
    loc = json['loc'];
    confirmedCasesIndian = json['confirmedCasesIndian'];
    confirmedCasesForeign = json['confirmedCasesForeign'];
    discharged = json['discharged'];
    deaths = json['deaths'];
    totalConfirmed = json['totalConfirmed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['loc'] = this.loc;
    data['confirmedCasesIndian'] = this.confirmedCasesIndian;
    data['confirmedCasesForeign'] = this.confirmedCasesForeign;
    data['discharged'] = this.discharged;
    data['deaths'] = this.deaths;
    data['totalConfirmed'] = this.totalConfirmed;
    return data;
  }
}
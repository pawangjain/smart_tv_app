class LanguageCode {
  Result result;

  LanguageCode({this.result});

  LanguageCode.fromJson(Map<String, dynamic> json) {
    result =
        json['result'] != null ? Result.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.toJson();
    }
    return data;
  }
}

class Result {
  List<Webtvlang> webtvlang;

  Result({this.webtvlang});

  Result.fromJson(Map<String, dynamic> json) {
    if (json['webtvlang'] != null) {
      List<Webtvlang> webtvlang = [];
      json['webtvlang'].forEach((v) {
        webtvlang.add(Webtvlang.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.webtvlang != null) {
      data['webtvlang'] = this.webtvlang.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Webtvlang {
  int cHANNELID;
  String cHANNELNAME;

  Webtvlang({this.cHANNELID, this.cHANNELNAME});

  Webtvlang.fromJson(Map<String, dynamic> json) {
    cHANNELID = json['CHANNEL_ID'];
    cHANNELNAME = json['CHANNEL_NAME'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['CHANNEL_ID'] = this.cHANNELID;
    data['CHANNEL_NAME'] = this.cHANNELNAME;
    return data;
  }
}

class LiveScheduleModel {
  LiveScheduleModel({
    this.liveschedule,
  });

  List<Liveschedule> liveschedule;

  LiveScheduleModel copyWith({
    List<Liveschedule> liveschedule,
  }) =>
      LiveScheduleModel(
        liveschedule: liveschedule ?? this.liveschedule,
      );

  factory LiveScheduleModel.fromJson(Map<String, dynamic> json) =>
      LiveScheduleModel(
        liveschedule: List<Liveschedule>.from(
            json["liveschedule"].map((x) => Liveschedule.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "liveschedule": List<dynamic>.from(liveschedule.map((x) => x.toJson())),
      };
}

class Liveschedule {
  Liveschedule({
    this.edname,
    this.esdate,
    this.eedate,
    this.estime,
    this.eetime,
    this.estime1,
    this.eetime1,
  });

  String edname;
  String esdate;
  String eedate;
  String estime;
  String eetime;
  String estime1;
  String eetime1;

  Liveschedule copyWith({
    String edname,
    String esdate,
    String eedate,
    String estime,
    String eetime,
    String estime1,
    String eetime1,
  }) =>
      Liveschedule(
        edname: edname ?? this.edname,
        esdate: esdate ?? this.esdate,
        eedate: eedate ?? this.eedate,
        estime: estime ?? this.estime,
        eetime: eetime ?? this.eetime,
        estime1: estime1 ?? this.estime1,
        eetime1: eetime1 ?? this.eetime1,
      );

  factory Liveschedule.fromJson(Map<String, dynamic> json) => Liveschedule(
        edname: json["EDNAME"],
        esdate: json["ESDATE"],
        eedate: json["EEDATE"],
        estime: json["ESTIME"] == null ? null : json["ESTIME"],
        eetime: json["EETIME"] == null ? null : json["EETIME"],
        estime1: json["ESTIME1"] == null ? null : json["ESTIME1"],
        eetime1: json["EETIME1"] == null ? null : json["EETIME1"],
      );

  Map<String, dynamic> toJson() => {
        "EDNAME": edname,
        "ESDATE": esdate,
        "EEDATE": eedate,
        "ESTIME": estime == null ? null : estime,
        "EETIME": eetime == null ? null : eetime,
        "ESTIME1": estime1 == null ? null : estime1,
        "EETIME1": eetime1 == null ? null : eetime1,
      };
}

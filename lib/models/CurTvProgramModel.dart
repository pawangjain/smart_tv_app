class CurTVProgramModel {
  String eMBEDCODE;
  int vIDEOID;
  String vIDEOPATH;
  String vIDEOSHORTNAME;
  String vIDEONAME;
  String iSLIVE;
  String duration;
  String fROMTIME;
  int tVSCHID;
  String iSPRIME;
  String iSVIDEO;
  String yOUTUBEEMBEDCODE;
  String vIDEOURL;

  CurTVProgramModel(
      {this.eMBEDCODE,
      this.vIDEOID,
      this.vIDEOPATH,
      this.vIDEOSHORTNAME,
      this.vIDEONAME,
      this.iSLIVE,
      this.duration,
      this.fROMTIME,
      this.tVSCHID,
      this.iSPRIME,
      this.iSVIDEO,
      this.yOUTUBEEMBEDCODE,
      this.vIDEOURL});

  factory CurTVProgramModel.fromJson(Map<String, dynamic> json) {
    return CurTVProgramModel(
      eMBEDCODE: json['EMBED_CODE'],
      vIDEOID: json['VIDEO_ID'],
      vIDEOPATH: json['VIDEO_PATH'],
      vIDEOSHORTNAME: json['VIDEO_SHORT_NAME'],
      vIDEONAME: json['VIDEO_NAME'],
      iSLIVE: json['IS_LIVE'],
      duration: json['Duration'],
      fROMTIME: json['FROMTIME'],
      tVSCHID: json['TV_SCH_ID'],
      iSPRIME: json['IS_PRIME'],
      iSVIDEO: json['IS_VIDEO'],
      yOUTUBEEMBEDCODE: json['YOUTUBE_EMBED_CODE'],
      vIDEOURL: json['VIDEO_URL'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['EMBED_CODE'] = this.eMBEDCODE;
    data['VIDEO_ID'] = this.vIDEOID;
    data['VIDEO_PATH'] = this.vIDEOPATH;
    data['VIDEO_SHORT_NAME'] = this.vIDEOSHORTNAME;
    data['VIDEO_NAME'] = this.vIDEONAME;
    data['IS_LIVE'] = this.iSLIVE;
    data['Duration'] = this.duration;
    data['FROMTIME'] = this.fROMTIME;
    data['TV_SCH_ID'] = this.tVSCHID;
    data['IS_PRIME'] = this.iSPRIME;
    data['IS_VIDEO'] = this.iSVIDEO;
    data['YOUTUBE_EMBED_CODE'] = this.yOUTUBEEMBEDCODE;
    data['VIDEO_URL'] = this.vIDEOURL;
    return data;
  }
}

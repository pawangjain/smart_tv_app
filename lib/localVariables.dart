import 'package:dadabhagwan_tv/common/constants.dart';
import 'package:dadabhagwan_tv/models/LiveScheduleModel.dart';
import 'package:dadabhagwan_tv/models/SpecialScheduleModel.dart';
import 'package:dadabhagwan_tv/models/TVScheduleModel.dart';

class LocalVariable {
  static List<Liveschedule> liveScedule = [];
  static Map<Language, List<Tvschedule>> tvScedule = {
    Language.GUJARATI: [],
    Language.HINDI: [],
    Language.ENGLISH: [],
  };
  static List<SpecialSatsang> specialSatsangSchedule = [];
}

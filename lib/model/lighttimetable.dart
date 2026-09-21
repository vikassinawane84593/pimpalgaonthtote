
class LightTimetable {

  String dayStartTime;
  String dayEndTime;
  String nightStartTime;
  String nightEndTime;
  String startDate;
  String endDate;



  LightTimetable({
    required this.dayStartTime,
    required this.dayEndTime ,
    required this.nightStartTime,
    required this. nightEndTime,
    required this. startDate,
    required this.endDate,
  });

  factory LightTimetable.fromMap(Map<String,dynamic>map ){

    return LightTimetable(

    dayStartTime :map['dayStart']??'2:0 Am',
    dayEndTime : map['dayEnd']??'2:0 Am',
    nightStartTime : map['nightStart']??'2:0 Am',
    nightEndTime : map['nightEnd']??'2:0 Am',
    startDate :map['startDate']??'2:0 Am',
    endDate : map['EndDate']??'2:0 Am'
    );
  }

}
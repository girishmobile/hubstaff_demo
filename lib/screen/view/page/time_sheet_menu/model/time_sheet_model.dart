class TimeSheetModel{
  String? title;
   List<TimeSheetSubModel> subItems=[];
   List<DayModel> ?dayList;
  TimeSheetModel({this.title, required this.subItems,this.dayList});
}

class DayModel{
  String? mon;
  String? tue;
  String? wed;
  String? thu;
  String? fri;
  String? sat;
  String? sun;
  String? project;
  String? taskName;
  String? total;

  DayModel(
      {this.mon, this.tue, this.wed, this.thu, this.fri, this.sat, this.sun,this.project,this.taskName,this.total});
}
class TimeSheetSubModel {
   String? project;
   String? companyName;
   String? taskName;
   String? activity;
   String? idle;
   String? manual;
   String? duration;
   String? time;


  TimeSheetSubModel({this.project,this.companyName,this.taskName,this.activity,this.idle,this.time,this.duration,this.manual});
}
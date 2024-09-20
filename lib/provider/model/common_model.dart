class CommonModel{
  String? url;
  String? title;
  String? project;
  String? date;
  String? startTime;
  String? endTime;
  String? duration;
  int? value;
  double? progressValue;
  bool? isFev;

  CommonModel(
      {this.url,
      this.title,
      this.date,
      this.startTime,
      this.endTime,
      this.duration,
      this.value,
        this.isFev,
      this.progressValue,

      });


}

class InnerItem {

  final String currentRate;
  final String totalHours;
  final String amount;
  InnerItem({required this.currentRate,required this.amount,required this.totalHours});
}
class OuterItem {
  final String title;

  final List<InnerItem> innerItems;

  OuterItem({required this.title, required this.innerItems,});
}
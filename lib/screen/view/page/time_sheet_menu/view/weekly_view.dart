import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/provider/dashboard_provider.dart';

import 'package:flutter/material.dart';

import '../model/time_sheet_model.dart';

class WeeklyView extends StatelessWidget {

  const WeeklyView({super.key,required this.itemProvider});
  final DashboardProvider itemProvider;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemProvider.itemLoadWeekly.length,
        itemBuilder: (context,index){
          var data=itemProvider.itemLoadWeekly[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(text: data.title,fontWeight: FontWeight.w600,fontSize: eighteen,color: Colors.black),


              Theme(
                data: Theme.of(context).copyWith(

                  cardTheme: CardTheme(
                    color: Colors.white,

                    elevation: zero, // remove shadow
                    margin: const EdgeInsets.all(zero), // reset margin
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(zero), // Change radius
                    ),
                  ),
                ),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: PaginatedDataTable(

                    //columnSpacing: 20.0,
                    dataRowMaxHeight: oneHundred,

                    rowsPerPage:itemProvider.itemLoadWeekly[index].dayList?.length!=null?itemProvider.itemLoadWeekly[index].dayList!.length:0,
                    onPageChanged: (pageIndex) {

                      itemProvider.selectedPage=pageIndex;

                    },
                    columns:  [
                      DataColumn(label: commonViewTitle(title: "",isShow: false)),
                      DataColumn(label: commonViewTitle(title: "9",days: "Mon")),
                      DataColumn(label: commonViewTitle(title: "10",days: "Tue")),
                      DataColumn(label: commonViewTitle(title: "11",days: "Wed")),
                      DataColumn(label: commonViewTitle(title: "12",days: "Thu")),
                      DataColumn(label: commonViewTitle(title: "13",days: "Fri")),
                      const DataColumn(label: CommonTextWidget(text: "Total",fontSize: thirty,fontWeight: FontWeight.w600,color:Colors.black)),

                    ], source: _DataSource(itemProvider.itemLoadWeekly[index].dayList??[],itemProvider),

                  ),
                ),
              )

            ],);
        });
  }
  commonViewTitle({String? title,String? days,bool isShow=true}){
    return Row(
      mainAxisSize: MainAxisSize.min,
    children: [
      CommonTextWidget(text: title??"9",fontSize: thirtySeven,fontWeight: FontWeight.w600,color:Colors.black),
      const SizedBox(width: ten,),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        CommonTextWidget(text: days??'',fontSize: fifteen,fontWeight: FontWeight.w400,color: Colors.black),
        CommonTextWidget(text: isShow==false?'':"Sep",fontSize: twelve,fontWeight: FontWeight.w400,color: Colors.black),

      ],)
    ],

    );
  }
}
class _DataSource extends DataTableSource {
  final List<DayModel> _data;
  DashboardProvider itemProvider;

  _DataSource(this._data,this.itemProvider);

  @override
  DataRow getRow(int index) {
    final data = _data[index];
    return DataRow(
      cells: [
        DataCell(ListTile(
          leading: Container(
            height: thirtyFive,
            alignment: Alignment.topRight,
            width: thirtyFive,
            decoration:  BoxDecoration(
              shape: BoxShape.circle,
              color: itemProvider.colors[index],
            ),
            child: Center(
              child: CommonTextWidget(text:data.project.toString()[0].toUpperCase() ,color: Colors.white),
            ),

          ),
          title: CommonTextWidget(text: data.project,fontSize: thirteen,fontWeight: FontWeight.w600,color: Colors.black),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(text: data.project,fontSize: eleven),
              CommonTextWidget(text: data.taskName,fontSize: thirteen,fontWeight:FontWeight.w600,color: Colors.black)
            ],),
        )),
        DataCell(CommonTextWidget(text: data.mon,fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.thu,fontSize: thirteen)),

        DataCell(CommonTextWidget(text:data.wed,fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.thu,fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.fri,fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.total,fontSize: thirteen)),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}

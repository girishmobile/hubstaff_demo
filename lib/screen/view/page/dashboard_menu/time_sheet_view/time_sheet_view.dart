import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:demo/provider/model/common_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class TimeSheetView extends StatelessWidget {
  const TimeSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<DashboardProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadTimeSheet();
    });
    return  Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        children: [
          commonTitleView(text: timeSheet.toUpperCase()),
          const SizedBox(height: twenty,),
          Theme(
            data: Theme.of(context).copyWith(
              dividerTheme: DividerThemeData(
                thickness: zero1,
                color: Colors.grey.withOpacity(zero20)
              ),
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
              columnSpacing: oneHundredTwenty,
                dataRowMaxHeight: seventy,
              rowsPerPage: itemProvider.itemProjectList.length>0?5:itemProvider.itemTimeSheet.length,
                availableRowsPerPage: [5, 10, 20],
   // rowsPerPage = itemProvider.itemTimeSheet.length > 5 ? 5 : itemProvider.itemTimeSheet.length;
                //  rowsPerPage: itemProvider.itemTimeSheet!=null?  itemProvider.itemTimeSheet.length:0,
                onPageChanged: (pageIndex) {
                  itemProvider.selectedPage=pageIndex;
                },
                onRowsPerPageChanged: (value){
                itemProvider.selectedRowPage=value??5;
                },
                columns:  [
                    DataColumn(label: CommonTextWidget(text: project,style: commonTextStyle(fontSize: twelve,color: Colors.black),)),
                  DataColumn(label: CommonTextWidget(text: date,style: commonTextStyle(fontSize: twelve,color: Colors.black),)),
                  DataColumn(label: CommonTextWidget(text: startTime,style: commonTextStyle(fontSize: twelve,color: Colors.black),)),
                  DataColumn(label: CommonTextWidget(text: stopTime,style: commonTextStyle(fontSize: twelve,color: Colors.black),)),
                  DataColumn(label: CommonTextWidget(text: duration,style: commonTextStyle(fontSize: twelve,color: Colors.black),)),
                ], source: _DataSource(itemProvider.itemTimeSheet,itemProvider),

              ),
            ),
          )
        ],
      ),
    );
  }
}
class _DataSource extends DataTableSource {
  final List<CommonModel> _data;
  DashboardProvider itemProvider;

  _DataSource(this._data,this.itemProvider);

  @override
  DataRow getRow(int index) {
    final data = _data[index];
    return DataRow(
      cells: [
        DataCell(Row(
          children: [
            Container(
              height: thirtyFive,
              width: thirtyFive,
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: itemProvider.colors[index],
              ),
              child: Center(
                child: CommonTextWidget(text:data.title.toString()[0].toUpperCase() ,color: Colors.white),
              ),

            ),
            const SizedBox(width: ten,),
            CommonTextWidget(text: data.title,fontSize: ten,)
          ],
        )),
        DataCell(CommonTextWidget(text: data.date,fontSize: eleven)),
        DataCell(CommonTextWidget(text: data.startTime,fontSize: eleven)),

        DataCell(CommonTextWidget(text:data.endTime,fontSize: eleven)),
        DataCell(CommonTextWidget(text: data.duration,fontSize: eleven)),
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
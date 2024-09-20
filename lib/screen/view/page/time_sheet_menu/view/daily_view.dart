import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';

import '../model/time_sheet_model.dart';

class DailyView extends StatelessWidget {
  const DailyView({super.key, required this.itemProvider});

  final DashboardProvider itemProvider;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: itemProvider.itemViewAndTimeSheet.length,
        itemBuilder: (context, index) {
          var data = itemProvider.itemViewAndTimeSheet[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(
                  text: data.title,
                  fontWeight: FontWeight.w600,
                  fontSize: eighteen,
                  color: Colors.black),
              FittedBox(
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  margin: const EdgeInsets.only(
                      left: ten, right: ten, top: ten, bottom: ten),
                  child: commonTimeView(),
                ),
              ),
              Theme(
                data: Theme.of(context).copyWith(
                  dividerTheme: DividerThemeData(
                      thickness: zero1, color: Colors.grey.withOpacity(zero20)),
                  cardTheme: CardTheme(
                    color: Colors.white,

                    elevation: zero, // remove shadow
                    margin: const EdgeInsets.all(zero), // reset margin
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(zero), // Change radius
                    ),
                  ),
                ),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: PaginatedDataTable(
                    dataRowMaxHeight: seventy,
                    showFirstLastButtons: false,
                    rowsPerPage: itemProvider
                        .itemViewAndTimeSheet[index].subItems.length,
                    onPageChanged: (pageIndex) {
                      itemProvider.selectedPage = pageIndex;
                    },
                    columns: [
                      DataColumn(
                          label: CommonTextWidget(
                        text: project,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.black),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: activity,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.black),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: idle,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.black),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: manual,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.black),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: duration,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.blueAccent),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: time,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.blueAccent),
                      )),
                      DataColumn(
                          label: CommonTextWidget(
                        text: action,
                        style: commonTextStyle(
                            fontSize: fifteen, color: Colors.black),
                      )),
                    ],
                    source: _DataSource(
                        itemProvider.itemViewAndTimeSheet[index].subItems,
                        itemProvider),
                  ),
                ),
              )
            ],
          );
        });
  }
}

class _DataSource extends DataTableSource {
  final List<TimeSheetSubModel> _data;
  DashboardProvider itemProvider;

  _DataSource(this._data, this.itemProvider);

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
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: itemProvider.colors[index],
            ),
            child: Center(
              child: CommonTextWidget(
                  text: data.project.toString()[0].toUpperCase(),
                  color: Colors.white),
            ),
          ),
          title: CommonTextWidget(
              text: data.project,
              fontSize: thirteen,
              fontWeight: FontWeight.w600,
              color: Colors.black),
          subtitle: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonTextWidget(text: data.companyName, fontSize: eleven),
              CommonTextWidget(
                  text: data.taskName,
                  fontSize: thirteen,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)
            ],
          ),
        )),
        DataCell(CommonTextWidget(text: data.activity, fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.idle, fontSize: thirteen)),
        DataCell(CommonTextWidget(text: data.manual, fontSize: thirteen)),
        DataCell(CommonTextWidget(
            text: data.duration, fontSize: thirteen, color: Colors.blueAccent)),
        DataCell(CommonTextWidget(
            text: data.time, fontSize: thirteen, color: Colors.blueAccent)),
        DataCell(CommonTextWidget(text: data.duration, fontSize: thirteen)),
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

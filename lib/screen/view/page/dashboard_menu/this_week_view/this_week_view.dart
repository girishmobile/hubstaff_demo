import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartDataPoint {
  final String label;
  final String timeValue;
  final double value;

  BarChartDataPoint(
      {required this.label, required this.value, required this.timeValue});
}

class ThisWeekView extends StatelessWidget {
  const ThisWeekView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final List<BarChartDataPoint> data = [
      BarChartDataPoint(label: 'Mon', value: 10, timeValue: "1:53"),
      BarChartDataPoint(label: 'Tue', value: 20, timeValue: "8:24"),
      BarChartDataPoint(label: 'Wed', value: 25, timeValue: "8:22"),
      BarChartDataPoint(label: 'Thu', value: 30, timeValue: "0:01"),
      BarChartDataPoint(label: 'Fri', value: 30, timeValue: "0:00"),
      BarChartDataPoint(label: 'Sat', value: 30, timeValue: "0:00"),
      BarChartDataPoint(label: 'Sun', value: 30, timeValue: "0:00"),
    ];
    return Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          commonTitleView(text: thisWeek.toUpperCase()),
          const SizedBox(
            height: thirty,
          ),
          SizedBox(
            height: 300,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                barGroups: data.map((dataPoint) {
                  return BarChartGroupData(
                    x: data.indexOf(dataPoint),
                    barRods: [
                      BarChartRodData(
                        toY: dataPoint.value,
                        color: Colors.blue,
                        width: twenty,
                      ),
                    ],
                    //  showingTooltipIndicators: [0],
                  );
                }).toList(),
                titlesData: FlTitlesData(
                  topTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: forty,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < data.length) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            data[index].timeValue,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }
                      return Container();
                    },
                  )),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: forty,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < data.length) {
                        return SideTitleWidget(
                          axisSide: meta.axisSide,
                          child: Text(
                            data[index].label,
                            style: const TextStyle(color: Colors.black),
                          ),
                        );
                      }
                      return Container();
                    },
                  )),
                  leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(
                  show: false,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: zero,
                  ),
                ),
                gridData: const FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  commonView({String? text}) {
    return Expanded(
      child: CommonTextWidget(text: text ?? "1:53"),
    );
  }
}

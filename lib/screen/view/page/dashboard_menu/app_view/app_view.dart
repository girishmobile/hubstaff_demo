import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<DashboardProvider>(context);
    // Load items when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadAppList();
    });

    return Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                  text: appState.toUpperCase(),
                  fontWeight: FontWeight.bold),
              const Icon(
                Icons.more_vert,
                color: Colors.grey,
              )
            ],
          ),
          const SizedBox(
            height: twenty,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                  text: appsURL.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: eleven),
              CommonTextWidget(
                  text: time.toUpperCase(),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: eleven),
            ],
          ),
          const Divider(
            thickness: zero3,
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: itemProvider.itemAppList.length,
            itemBuilder: (context, index) {
              var item = itemProvider.itemAppList[index];
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: CommonTextWidget(text: item.title, fontSize: twelve),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonTextWidget(text: item.startTime, fontSize: twelve),
                    const SizedBox(
                      width: ten,
                    ),
                    SizedBox(
                      width: fifty,
                      child: commonProgressbarLine(value: item.progressValue),
                    )
                  ],
                ),
                leading: Container(
                  width: thirtyFive,
                  height: thirtyFive,
                  decoration: BoxDecoration(
                      color: context.read<DashboardProvider>().colors[index],
                      shape: BoxShape.circle),
                  child: Center(
                    child: CommonTextWidget(
                        text: item.title.toString()[0].toUpperCase(),
                        color: Colors.white,
                        fontSize: twelve),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness:zero3,
              );
            },
          ),
          const Divider(
            thickness: zero3,
          ),
          const SizedBox(
            height: twentyFive,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonTextWidget(text:viewReport, color: Colors.blue),
              Icon(
                Icons.arrow_forward_ios_outlined,
                color: Colors.blue,
                size: ten,
              )
            ],
          )
        ],
      ),
    );
  }
}

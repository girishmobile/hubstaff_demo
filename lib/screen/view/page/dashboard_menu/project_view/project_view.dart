import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<DashboardProvider>(context);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadProjectList();
    });

    return Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonTextWidget(
                  text: projects.toUpperCase(), fontWeight: FontWeight.bold),
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
                  text: projects.toUpperCase(),
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
            itemCount: itemProvider.itemProjectList.length,
            itemBuilder: (context, index) {
              return ListTile(
                contentPadding: EdgeInsets.zero,
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: CommonTextWidget(
                          text: itemProvider.itemProjectList[index].title,
                          fontSize: twelve),
                    ),
                    const SizedBox(
                      width: ten,
                    ),
                    Container(
                      width: thirtyFive,
                      height: twenty,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(fifteen)),
                      child: Center(
                        child: CommonTextWidget(
                            fontSize: ten,
                            text:
                                "${itemProvider.itemProjectList[index].value}%",
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CommonTextWidget(
                        text: itemProvider.itemProjectList[index].startTime,
                        fontSize: twelve),
                    const SizedBox(
                      width: ten
                    ),
                    SizedBox(
                      width: fifty,
                      child: commonProgressbarLine(value: zero5),
                    )
                  ],
                ),
                leading: Container(
                  width: thirtyFive,
                  height: thirtyFive,
                  decoration: BoxDecoration(
                      color: itemProvider.colors[index],
                      shape: BoxShape.circle),
                  child: Center(
                    child: CommonTextWidget(
                        text: itemProvider.itemProjectList[index].title
                            .toString()[0]
                            .toUpperCase(),
                        color: Colors.white,
                        fontSize: twelve),
                  ),
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: zero3,
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
              CommonTextWidget(text: viewReport, color: Colors.blue),
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

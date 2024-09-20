import 'package:demo/core/common/common_button_widget.dart';
import 'package:demo/core/common/common_text_widget.dart';
import 'package:demo/core/component.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/responsive.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:demo/provider/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecentView extends StatelessWidget {
  const RecentView({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = Responsive.isMobile(context);
    final itemProvider = Provider.of<DashboardProvider>(context);

    // Load items when the screen is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      itemProvider.loadRecentData();
    });

    return Padding(
      padding: const EdgeInsets.all(fifteen),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          commonTitleView(text: "Recent Activity"),
          const SizedBox(
            height: twenty,
          ),
          GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: twoHundred,
              crossAxisCount: isMobile ? 1 : 3, // number of items in each row
              mainAxisSpacing: twenty, // spacing between rows
              crossAxisSpacing: twenty, // spacing between columns
            ),
            padding: const EdgeInsets.all(zero),
            // padding around the grid
            itemCount: itemProvider.itemRecent.length,
            // total number of items
            itemBuilder: (context, index) {
              return ImageView(
                index: index,
                time: itemProvider.itemRecent[index].startTime.toString(),
                imageUrl: itemProvider.itemRecent[index].url.toString(),
                isHovered: itemProvider.hoveredIndex == index,
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonTextWidget(text: viewActivity, color: Colors.blue),
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

class ImageView extends StatelessWidget {
  final int index;
  final String imageUrl;
  final String time;
  final bool isHovered;

  const ImageView({
    super.key,
    required this.time,
    required this.index,
    required this.imageUrl,
    required this.isHovered,
  });

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<DashboardProvider>(context, listen: false);

    return MouseRegion(
      onEnter: (_) => itemProvider.setHoveredIndex(index),
      onExit: (_) => itemProvider.setHoveredIndex(null),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              loadNetworkImage(
                  url: itemProvider.itemRecent[index].url.toString()),
              if (isHovered)
                Positioned(
                  bottom: zero,
                  top: zero,
                  left: zero,
                  right: zero,
                  child: Container(
                    color: Colors.black.withOpacity(zero7),
                    padding: const EdgeInsets.all(eight),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CommonButtonWidget(
                              text: viewScreen,
                              color: Colors.white,
                              colorText: Colors.black,
                              horizontal: fifteen,
                              vertical: eight),
                          const SizedBox(
                            height: ten,
                          ),
                          CommonTextWidget(text: time, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          Positioned(
              right: zero,
              top: -8,
              child: Container(
                width: forty,
                height: twenty,
                decoration: BoxDecoration(
                    color: itemProvider.itemRecent[index].value! > 50
                        ? Colors.green
                        : itemProvider.itemRecent[index].value! > 20
                            ? Colors.amber
                            : Colors.red,
                    borderRadius: BorderRadius.circular(fifteen)),
                child: Center(
                  child: CommonTextWidget(
                      fontSize: twelve,
                      text: '${itemProvider.itemRecent[index].value}%',
                      color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}

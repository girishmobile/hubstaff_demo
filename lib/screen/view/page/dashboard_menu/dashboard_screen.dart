import 'package:demo/core/Responsive.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/screen/view/page/dashboard_menu/app_view/app_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/project_view/project_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/recent_view/recent_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/this_week_view/this_week_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/time_sheet_view/time_sheet_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/to_do_view/todo_view.dart';
import 'package:demo/screen/view/page/dashboard_menu/top_view/top_view.dart';



import 'package:flutter/material.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.sizeOf(context);
    var isMobile=Responsive.isMobile(context);
    return  Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Expanded(
                child: Container(
                  color: colorBody,
                  width: size.width,
                  height: size.height,
                  child: ListView(
                    children:  [
                      const TopView(),
                     isMobile? Column(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Container(
                           margin: const EdgeInsets.all(ten),
                           width: size.width,
                           height: size.height,
                           child:  Padding(
                             padding: const EdgeInsets.all(twelve),
                             child: ListView(
                               children: const [
                                 Column(
                                   children: [
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: RecentView()),
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: ThisWeekView()),
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: TodoView())
                                   ],
                                 ),
                               ],
                             ),
                           ),),
                         SizedBox(
                           width: size.width,
                           height: size.height,

                           child: Padding(
                             padding: const EdgeInsets.all(twelve),
                             child: ListView(
                               shrinkWrap: true,
                               children: const [
                                 Column(
                                   children: [
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: TimeSheetView()),
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: ProjectView()),
                                     Card(
                                         elevation: zero,
                                         color: Colors.white,
                                         child: AppView())
                                   ],
                                 ),
                               ],
                             ),
                           ),)
                       ],
                     ): Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Expanded(
                             flex: 5,
                             child: Container(
                               margin: const EdgeInsets.all(ten),
                               width: size.width,
                               height: size.height,
                               child:  Padding(
                                 padding: const EdgeInsets.all(twelve),
                                 child: ListView(
                                   children: const [
                                     Column(
                                       children: [
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: RecentView()),
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: ThisWeekView()),
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: TodoView())
                                       ],
                                     ),
                                   ],
                                 ),
                               ),)),
                         Expanded(
                             flex: 5,
                             child: SizedBox(
                               width: size.width,
                               height: size.height,

                               child: Padding(
                                 padding: const EdgeInsets.all(twelve),
                                 child: ListView(
                                   shrinkWrap: true,
                                   children: const [
                                     Column(
                                       children: [
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: TimeSheetView()),
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: ProjectView()),
                                         Card(
                                             elevation: zero,
                                             color: Colors.white,
                                             child: AppView())
                                       ],
                                     ),
                                   ],
                                 ),
                               ),))
                       ],
                     )
                    ],
                  ),)),
          ],
        ),
      ),
    );
  }


}



import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/core/color.dart';
import 'package:demo/core/constants/num_constants.dart';
import 'package:demo/core/string_utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'common/common_text_widget.dart';
import 'common/common_time_progressbar.dart';


commonInkWell({Widget? child,VoidCallback? onTap}){
  return    InkWell(
    onTap: onTap,
    child: child,

  );

}

commonBackButton({required BuildContext  context}){
  return Align(
      alignment: Alignment.topLeft,
      child: Container(
        width: thirtyFive,
        margin: const EdgeInsets.only(left: ten,top: twenty),
        height: thirtyFive,
        decoration: const BoxDecoration(
            color: colorDarkBlue,
            shape: BoxShape.circle
        ),
        child: Center(child: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: const Icon(Icons.arrow_back,color: Colors.white,size: twenty,))),));
}
TextStyle commonTextStyle(
    {double? fontSize, FontWeight? fontWeight, Color? color}){
  return  GoogleFonts.roboto(

      color:color?? Colors.black.withOpacity(zero50),
      fontWeight:fontWeight??FontWeight.w500 ,
      fontSize: fontSize??fourteen
  );
}
commonVerticalLine(){
  return   const VerticalDivider(
    indent: ten,
    endIndent: ten,

  );

}

commonTitleView({String? text}){
  return      Row(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CommonTextWidget(text: text??"This Week".toUpperCase(),fontWeight: FontWeight.bold),
      const Icon(Icons.more_vert,color: Colors.grey,)
    ],
  );
}

loadNetworkImage({required String url}){
  return CachedNetworkImage(
    imageUrl: url,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            ),
      ),
    ),
    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );

}

commonProgressbarLine({double ?value,double? height,Color? color,Color? bg}){
  return  ClipRRect(
    borderRadius: BorderRadius.circular(eight),
    child: SizedBox(
      height:height?? five,
      child: LinearProgressIndicator(
        value:value??zero, // percent filled
        valueColor: AlwaysStoppedAnimation<Color>(color??Colors.blue),
        backgroundColor: bg??Colors.blue.withOpacity(zero20),
      ),
    ),
  );
}
commonTimeView(){
  return ClipRRect(
    borderRadius: BorderRadius.circular(eight),
    child: FittedBox(
      child: Container(
        height: 4,
        color: Colors.brown.withOpacity(zero20),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CommonTimeProgressbar(startTime: '6 AM', endTime: '9 AM', isActive: true,width: 20,),
            CommonTimeProgressbar(startTime: '9 AM', endTime: '12 PM', isActive: true,width: 100,),
            CommonTimeProgressbar(startTime: '12 PM', endTime: '6 PM', isActive: false,width: 200,),
            CommonTimeProgressbar(startTime: '6 AM', endTime: '9 AM', isActive: true,width: 80,),
            CommonTimeProgressbar(startTime: '9 AM', endTime: '12 PM', isActive: true,width: 90,),
      
          ],
        ),
      ),
    ),
  );
}

commonButtonView({String? text,IconData? icon,}) {
  return Row(
    children: [
      Icon(icon??Icons.send,color: coloBlue,),
      const SizedBox(width: three,),
      CommonTextWidget(
        color: coloBlue,
        text:text??send,
      )
    ],
  );
}

commonArrowView(
    {double? width, double? height, Widget? child, IconData? icon}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(seven),
        border: Border.all(color: Colors.grey.withOpacity(zero20))),
    child: child ??
        Center(
          child: Icon(
            icon ?? Icons.arrow_back,
            size: sixteen,
            color: Colors.grey,
          ),
        ),
  );
}
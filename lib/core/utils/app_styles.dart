import 'package:flutter/widgets.dart';

class Styles {
  static TextStyle Mediume20(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: Color(0xff1F2261),
      fontFamily: "sangbleu-sans",
    );
  }

  static TextStyle Reguler14(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w400,
      color: Color(0xff808080),
      fontFamily: "sangbleu-sans",
    );
  }

  static TextStyle Reguler12(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w400,
      color: Color(0xffA6A1A1),
      fontFamily: "sangbleu-sans",
    );
  }

  static TextStyle Reguler16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w400,
      color: Color(0xff808080),
      fontFamily: "sangbleu-sans",
    );
  }

  static TextStyle Mediume18(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: Color(0xff3C3C3C),
      fontFamily: "sangbleu-sans",
    );
  }

  static TextStyle Mediume16(context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: Color(0xff26278D),
      fontFamily: "sangbleu-sans",
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 375;
  } else if (width < 1200) {
    return width / 1000;
  } else {
    return width / 1440;
  }
}

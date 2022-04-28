// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) => LightModeTheme();

  Color primaryColor;
  Color secondaryColor;
  Color tertiaryColor;
  Color alternate;
  Color primaryBackground;
  Color secondaryBackground;
  Color primaryText;
  Color secondaryText;

  TextStyle get title1 => GoogleFonts.getFont(
        'Poppins',
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontSize: 26,
      );
  TextStyle get title2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 22,
        fontStyle: FontStyle.normal,
      );
  TextStyle get title3 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 13,
      );
  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Poppins',
        color: primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 11,
      );
  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Poppins',
        color: secondaryText,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      );
}

class LightModeTheme extends FlutterFlowTheme {
  Color primaryColor = const Color(0xFFEE8224);
  Color secondaryColor = const Color(0xFFFCD533);
  Color tertiaryColor = const Color(0xFFFFEBBE);
  Color alternate = const Color(0xFFFF5963);
  Color primaryBackground = const Color(0xFFF8F8F8);
  Color secondaryBackground = const Color(0xFFFFFFFF);
  Color primaryText = const Color(0xFF000000);
  Color secondaryText = const Color(0xFF717171);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String fontFamily,
    Color color,
    double fontSize,
    FontWeight fontWeight,
    FontStyle fontStyle,
    bool useGoogleFonts = true,
    TextDecoration decoration,
    double lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}

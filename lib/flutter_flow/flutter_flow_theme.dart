// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';

const kThemeModeKey = '__theme_mode__';
SharedPreferences? _prefs;

abstract class FlutterFlowTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static FlutterFlowTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkModeTheme()
        : LightModeTheme();
  }

  late Color primaryColor;
  late Color secondaryColor;
  late Color tertiaryColor;
  late Color alternate;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color primaryText;
  late Color secondaryText;

  late Color background;
  late Color darkBackground;
  late Color textColor;
  late Color grayDark;
  late Color grayLight;

  String get title1Family => typography.title1Family;

  TextStyle get title1 => typography.title1;

  String get title2Family => typography.title2Family;

  TextStyle get title2 => typography.title2;

  String get title3Family => typography.title3Family;

  TextStyle get title3 => typography.title3;

  String get subtitle1Family => typography.subtitle1Family;

  TextStyle get subtitle1 => typography.subtitle1;

  String get subtitle2Family => typography.subtitle2Family;

  TextStyle get subtitle2 => typography.subtitle2;

  String get bodyText1Family => typography.bodyText1Family;

  TextStyle get bodyText1 => typography.bodyText1;

  String get bodyText2Family => typography.bodyText2Family;

  TextStyle get bodyText2 => typography.bodyText2;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFFf68622);
  late Color secondaryColor = const Color(0xFF8ab78b);
  late Color tertiaryColor = const Color(0xFF39D2C0);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryBackground = const Color(0xFFF1F4F8);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color primaryText = const Color(0xFF1A1F24);
  late Color secondaryText = const Color(0xFF8B97A2);

  late Color background = Color(0xFF1A1F24);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color grayDark = Color(0xFF57636C);
  late Color grayLight = Color(0xFF8B97A2);
}

abstract class Typography {
  String get title1Family;

  TextStyle get title1;

  String get title2Family;

  TextStyle get title2;

  String get title3Family;

  TextStyle get title3;

  String get subtitle1Family;

  TextStyle get subtitle1;

  String get subtitle2Family;

  TextStyle get subtitle2;

  String get bodyText1Family;

  TextStyle get bodyText1;

  String get bodyText2Family;

  TextStyle get bodyText2;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get title1Family => 'Outfit';

  TextStyle get title1 => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 32.0,
      );

  String get title2Family => 'Outfit';

  TextStyle get title2 => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 28.0,
      );

  String get title3Family => 'Outfit';

  TextStyle get title3 => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 20.0,
      );

  String get subtitle1Family => 'Outfit';

  TextStyle get subtitle1 => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.w500,
        fontSize: 18.0,
      );

  String get subtitle2Family => 'Outfit';

  TextStyle get subtitle2 => GoogleFonts.getFont(
        'Outfit',
        color: theme.alternate,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );

  String get bodyText1Family => 'Outfit';

  TextStyle get bodyText1 => GoogleFonts.getFont(
        'Outfit',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );

  String get bodyText2Family => 'Outfit';

  TextStyle get bodyText2 => GoogleFonts.getFont(
        'Outfit',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
}

class DarkModeTheme extends FlutterFlowTheme {
  late Color primaryColor = const Color(0xFF8ab78b);
  late Color secondaryColor = const Color(0xFFf68622);
  late Color tertiaryColor = const Color(0xFF39D2C0);
  late Color alternate = const Color(0xFFFFFFFF);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF111417);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF8B97A2);

  late Color background = Color(0xFF1A1F24);
  late Color darkBackground = Color(0xFF111417);
  late Color textColor = Color(0xFFFFFFFF);
  late Color grayDark = Color(0xFF57636C);
  late Color grayLight = Color(0xFF8B97A2);
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
            );
}

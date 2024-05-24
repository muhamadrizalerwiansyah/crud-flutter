import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeStyle {
  TextTheme textThemeStyle() {
    return TextTheme(
      labelMedium: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      )),
      titleLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
      )),
      titleMedium: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      )),
      bodyLarge: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
      )),
      bodyMedium: GoogleFonts.poppins(
          textStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      )),
      bodySmall: GoogleFonts.poppins(
          textStyle: TextStyle(
              color: Color(0xFF707973),
              fontSize: 12,
              fontWeight: FontWeight.w400)),
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeStyle() {
    return ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF103b87),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)))));
  }

  OutlinedButtonThemeData outlinedButtonThemeData() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          side: BorderSide(width: 1, color: Color(0xFF103b87))),
    );
  }

  // theming for input decoration
  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xFFC4CDD5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFC4CDD5)),
        ),
        fillColor: Color(0xFFFFFFFF),
        labelStyle: TextStyle(
            color: Color(0xFF707973),
            fontSize: 12,
            fontWeight: FontWeight.w400));
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Color(0xFFC4CDD5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xFFC4CDD5)),
        ),
        fillColor: Color(0xFFFFFFFF),
        labelStyle: TextStyle(
            color: Color(0xFF707973),
            fontSize: 16,
            fontWeight: FontWeight.w500));
  }

  ChipThemeData chipThemedData() {
    return ChipThemeData();
    // return ChipThemeData.fromDefaults(
    //     primaryColor: Color(0xFF103b87),
    //     secondaryColor: Color(0xFF103b87),
    //     labelStyle:
    //         textThemeStyle().bodyMedium!.copyWith(color: Color(0xFF103b87)));
  }
}

class Style {
  static TextStyle boldBlackText = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black87);
  static TextStyle boldSmBlackText = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 12, color: Colors.black87);
  static TextStyle smBlackText = TextStyle(fontSize: 12, color: Colors.black87);

  static TextStyle boldMdBlackText = TextStyle(
      fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87);

  static TextStyle bolderBlackText = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 16, color: Colors.black87);
  static TextStyle bolderPrimaryText = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 16, color: Color(0xFF103b87));

  static TextStyle titleText = TextStyle(
      fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black87);

  static TextStyle boldGreyText =
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.grey);

  static TextStyle blackSMInfoText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.underline,
    color: const Color(0xFF41544A),
  );

  static TextStyle primaryText = TextStyle(
    color: Color(0xFF103b87),
  );

  static TextStyle greyText = TextStyle(
    color: Colors.grey.withOpacity(.8),
  );

  static TextStyle hintText =
      TextStyle(color: Colors.grey.withOpacity(.8), fontSize: 11);

  static TextStyle primaryBold = TextStyle(
      color: Color(0xFF103b87), fontSize: 14, fontWeight: FontWeight.w600);

  static TextStyle primaryMdBold = TextStyle(
    color: Color(0xFF103b87),
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );

  static TextStyle primarySmBold = TextStyle(
    color: Color(0xFF103b87),
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );

  static TextStyle blackText = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: const Color(0xFF41544A));

  static TextStyle paragraphText =
      TextStyle(color: const Color(0xFF8896A2), fontSize: 11);

  static TextStyle greyMdText =
      TextStyle(color: const Color(0xFF8896A2), fontSize: 14);

  InputDecoration inputDecoration() {
    return InputDecoration(
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.red),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFFC4CDD5)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFFC4CDD5)),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Color(0xFFC4CDD5)),
      ),
      fillColor: Color(0xFFFFFFFF),
      labelStyle: TextStyle(
          color: Color(0xFF707973), fontSize: 12, fontWeight: FontWeight.w500),
      contentPadding: EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

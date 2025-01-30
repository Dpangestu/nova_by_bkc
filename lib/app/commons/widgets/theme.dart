import 'package:flutter/material.dart';

final ThemeData customTheme = ThemeData(
  primaryColor: Colors.blue[400],
  scaffoldBackgroundColor: Colors.grey[200],
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF225CAB),
    titleTextStyle: TextStyle(
      fontSize: 18,
      color: Color(0xffFFFFFF),
      fontWeight: FontWeight.w200,
      fontFamily: 'FuturaBook',
    ),
    iconTheme: IconThemeData(color: Colors.white),
  ),
  textSelectionTheme: TextSelectionThemeData(
    cursorColor: Colors.blue[400],
    selectionColor: Colors.blue[100],
    selectionHandleColor: Colors.blue[400],
  ),
  popupMenuTheme: PopupMenuThemeData(
    color: Colors.white,
    textStyle: const TextStyle(color: Colors.black),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  datePickerTheme: DatePickerThemeData(
    backgroundColor: Colors.white,
    headerBackgroundColor: Colors.blue[400],
    headerForegroundColor: Colors.white,
    dayStyle: const TextStyle(color: Colors.black),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.all(8),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    hintStyle: const TextStyle(fontFamily: 'FuturaBook', color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
  ),
  // textTheme: const TextTheme(
  //   headlineSmall: TextStyle(
  //     fontSize: 32,
  //     fontWeight: FontWeight.bold,
  //     fontFamily: 'FuturaBook',
  //     // color: Colors.black,
  //   ), // Title for forms
  //   titleLarge: TextStyle(
  //     fontSize: 20,
  //     fontWeight: FontWeight.w600,
  //     fontFamily: 'FuturaBook',
  //     color: Colors.white,
  //   ), // App bar title
  //   bodyLarge: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.normal,
  //     fontFamily: 'FuturaBook',
  //     // color: Colors.black,
  //   ), // Normal body text
  //   bodyMedium: TextStyle(
  //     fontSize: 14,
  //     fontWeight: FontWeight.normal,
  //     fontFamily: 'FuturaBook',
  //     // color: Colors.grey[800],
  //   ), // Secondary body text
  //   labelLarge: TextStyle(
  //     fontSize: 16,
  //     fontWeight: FontWeight.bold,
  //     fontFamily: 'FuturaBook',
  //     // color: Colors.white,
  //   ), // Button text
  // ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  ).copyWith(
    primary: Colors.blue[400],
  ),
);

class BackgroundRectangles extends StatelessWidget {
  const BackgroundRectangles({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double upperHeight = size.height * 0.4;
    final double lowerHeight = size.height - upperHeight;

    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: size.width,
          height: upperHeight,
          child: Container(
            color: const Color(0xFF225CAB),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          width: size.width,
          height: lowerHeight,
          child: Container(
            color: const Color(0xffF1F1F1),
          ),
        ),
      ],
    );
  }
}

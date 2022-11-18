import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/helpers/colors.dart';
import 'package:portfolio/presentation/screens/screens.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //BarEventsCubit
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Mouad zizi',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          scaffoldBackgroundColor: kColorBackground,
          textTheme: GoogleFonts.oxygenTextTheme(Theme.of(context).textTheme),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const WelcomeScreen(),
          '/contact': (_) => const ContactScreen(),
        },
      );
    });
  }
}

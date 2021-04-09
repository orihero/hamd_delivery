import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/ui/auth/auth_screen.dart';
import 'package:HAMD_Delivery/ui/landing/widgets/language_choice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenSize.height * 0.25,
                right: screenSize.width * 0.24,
                left: screenSize.width * 0.24),
            child: Image.asset('assets/images/logo.png'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 67),
                  child: LanguageChoosing(
                    function: () {
                      Get.to(() => AuthScreen());
                    },
                    iconName: 'assets/icons/russia.svg',
                    text: 'Русский язык',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LanguageChoosing(
                  function: () {
                    Get.to(() => AuthScreen());
                  },
                  iconName: 'assets/icons/uzbekistan.svg',
                  text: 'O\'zbek tili',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

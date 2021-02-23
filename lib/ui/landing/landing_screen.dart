import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
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
          // Container(
          //   height: MediaQuery.of(context).size.height * .45,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(15),
          //       bottomRight: Radius.circular(15),
          //     ),
          //     color: Color(0xff9F111B),
          //   ),
          //   child: Image.asset(
          //     'assets/images/splash.png',
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                // Padding(
                //   padding: EdgeInsets.only(right: 37, left: 37, top: 67),
                //   child: Text(
                //       'На каком языке Вы предпо  читаете пользоваться нашим приложением?',
                //       style: FontStyles.semiBoldStyle(
                //           fontSize: 14, fontFamily: 'Ubuntu')),
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 67),
                  child: LanguageChoosing(
                    function: () {
                      Get.to(AuthScreen());
                    },
                    // function: () => Get.to(MyPageView()),
                    // function: () => Get.to(AuthScreen()),
                    iconName: 'assets/icons/russia.svg',
                    text: 'Русский язык',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LanguageChoosing(
                  function: () {
                    Get.to(AuthScreen());
                  },
                  // function: () => Get.to(MyPageView()),
                  // function: () => Get.to(AuthScreen()),

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

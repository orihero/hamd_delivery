import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

PreferredSize buildProfleSettingsAppBar(BuildContext context) {
  return PreferredSize(
    child: AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: ColorPalatte.strongRedColor,
      elevation: 0,
      flexibleSpace: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 10),
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                        size: 26,
                      ),
                      onPressed: () => Get.back(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'Мой профиль',
                  textAlign: TextAlign.center,
                  style: FontStyles.boldStyle(
                    fontSize: 18,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: IconButton(
                      icon: Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                        size: 26,
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                'Вы действительно хотите выйти?',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              actions: [
                                FlatButton(
                                  onPressed: () => Get.back(),
                                  child: Text(
                                    'нет'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: ColorPalatte.strongRedColor,
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  child: Text(
                                    'да'.toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 15.0,
                                      color: ColorPalatte.strongRedColor,
                                    ),
                                  ),
                                  onPressed: () {
                                    MyPref.allTokentsClear();
                                    Get.offAll(LandingScreen());
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(
        kToolbarHeight + MediaQuery.of(context).viewPadding.top),
  );
}

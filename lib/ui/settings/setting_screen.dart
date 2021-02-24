import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/landing/widgets/language_choice.dart';
import 'package:HAMD_Delivery/ui/settings/profile_settings/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
  _showSnackBar(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            content: Container(
              width: MediaQuery.of(context).size.width * 0.75,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 20, right: 8, left: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LanguageChoosing(
                      function: () => Get.back(),
                      iconName: 'assets/icons/russia.svg',
                      text: 'Русский язык',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LanguageChoosing(
                      function: () => Get.back(),
                      iconName: 'assets/icons/uzbekistan.svg',
                      text: 'O\'zbek tili',
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: customAppBar(
          context,
          title: 'Настройки',
          onpress1: () => Get.back(),
        ),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      body: Column(
        children: [
          Container(
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              color: ColorPalatte.strongRedColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 0, top: 10),
              child: ListView(
                children: [
                  ListTile(
                    onTap: () => _showSnackBar(context),
                    title: Text(
                      'Язык приложения',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff232323),
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.navigate_next), onPressed: null),
                  ),
                  ListTile(
                    onTap: () => Get.to(ProfileSettings()),
                    title: Text(
                      'Настройки профиля',
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xff232323),
                      ),
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.navigate_next), onPressed: null),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

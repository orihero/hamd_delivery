import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/settings/profile_settings/profile_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatelessWidget {
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
                    // onTap: () => Get.to(page),
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

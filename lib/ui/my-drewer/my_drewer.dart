import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/income/income_sceen.dart';
import 'package:HAMD_Delivery/ui/my-drewer/menu_options.dart';
import 'package:HAMD_Delivery/ui/my-order/my_order_srceen.dart';
import 'package:HAMD_Delivery/ui/my_platic_card/my_plastic_card.dart';
import 'package:HAMD_Delivery/ui/settings/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/profile_settings/profile_settings.dart';

class MyDrewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 45,
            left: 17,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(top: 20),
              // child: Container(
              //   width: 75,
              //   height: 75,
              //   decoration: BoxDecoration(
              //     shape: BoxShape.circle,
              //     color: Colors.red,
              //   ),
              //   child: Center(
              //     child: Image.asset('assets/images/user.png'),
              //   ),
              // ),
              //     ),
              //     Column(
              //       children: [
              //         Container(
              //           width: 50,
              //           height: 50,
              //           decoration: BoxDecoration(
              //               shape: BoxShape.circle, color: Colors.white),
              //           child: IconButton(
              //               icon: Icon(
              //                 Icons.star,
              //                 size: 30,
              //                 color: Color(0xff9F111B),
              //               ),
              //               onPressed: () {}),
              //         ),
              //         SizedBox(
              //           height: 12,
              //         ),
              //         Text(
              //           '4.5',
              //           style: FontStyles.boldStyle(
              //             fontSize: 18,
              //             fontFamily: 'Ubuntu',
              //             color: Color(0xff232323),
              //           ),
              //         ),
              //         SizedBox(
              //           height: 8,
              //         ),
              // Text(
              //   'Рейтинг',
              //   style: FontStyles.lightStyle(
              //     fontSize: 18,
              //     fontFamily: 'Ubuntu',
              //     color: Color(0xff232323),
              //   ),
              // ),
              //       ],
              //     ),
              //   ],
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  top: 13,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Image.asset('assets/images/user.png'),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Мирмахмудов Фарход',
                                style: FontStyles.regularStyle(
                                  fontSize: 15,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff232323),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '+998 90 377 33 85',
                                style: FontStyles.boldStyle(
                                  fontSize: 15,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff232323),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Text(
                    //   'Мирмахмудов Фарход',
                    //   style: FontStyles.regularStyle(
                    //     fontSize: 15,
                    //     fontFamily: 'Ubuntu',
                    //     color: Color(0xff232323),
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // Text(
                    //   '+998 90 377 33 85',
                    //   style: FontStyles.boldStyle(
                    //     fontSize: 18,
                    //     fontFamily: 'Ubuntu',
                    //     color: Color(0xff232323),
                    //   ),
                    // ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Рейтинг',
                            style: FontStyles.lightStyle(
                              fontSize: 18,
                              fontFamily: 'Ubuntu',
                              color: Color(0xff232323),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              Text(
                                '4.5',
                                style: FontStyles.lightStyle(
                                  fontSize: 18,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff232323),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 18,
                                color: Color(0xff9F111B),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 0),
              Divider(
                color: Color(0xffEAECF1),
                thickness: 2.0,
              ),
              SizedBox(height: 0),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuOptions(
                      title: 'Мой Заработок',
                      onpress: () => Get.to(IncomeSreen()),
                    ),
                    SizedBox(height: 0),
                    Divider(
                      color: Color(0xffEAECF1),
                      thickness: 2.0,
                    ),
                    MenuOptions(
                      title: 'Заказы',
                      onpress: () => Get.to(MyOrdersScreen()),
                    ),
                    SizedBox(height: 0),
                    Divider(
                      color: Color(0xffEAECF1),
                      thickness: 2.0,
                    ),
                    MenuOptions(
                        title: 'Настройка',
                        onpress: () => Get.to(
                              SettingScreen(),
                            )),
                    SizedBox(height: 0),
                    Divider(
                      color: Color(0xffEAECF1),
                      thickness: 2.0,
                    ),
                    MenuOptions(
                      title: 'Мой профиль',
                      onpress: () => Get.to(ProfileSettings()),
                    ),
                    SizedBox(height: 0),
                    Divider(
                      color: Color(0xffEAECF1),
                      thickness: 2.0,
                    ),
                    MenuOptions(
                      title: 'Моя карта',
                      onpress: () {
                        Get.to(MyPlasticCard());
                      },
                    ),
                    SizedBox(height: 0),
                    Divider(
                      color: Color(0xffEAECF1),
                      thickness: 2.0,
                    ),
                  ],
                ),
              ),
              Spacer(),
              Divider(
                color: Color(0xffEAECF1),
                thickness: 2.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Версия 1.0',
                      style: FontStyles.regularStyle(
                        fontSize: 10,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff232323),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

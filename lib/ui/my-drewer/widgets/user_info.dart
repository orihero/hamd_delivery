import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class UserInfo extends StatelessWidget {
  final UserProfileController ppController = Get.find<UserProfileController>();
  @override
  Widget build(BuildContext context) {
    // final UserDataController userDataController = Get.put(UserDataController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Obx(() {
        print(ppController.profileList.first.phone);
        if (ppController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!ppController.isLoading.value &&
            ppController.profileList.isNotEmpty) {
          return Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(
                  'http://hamd.loko.uz/' + ppController.profileList.first.photo,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ppController.profileList.first.name ?? '',
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
                      ppController.profileList.first.phone,
                      style: FontStyles.boldStyle(
                        fontSize: 15,
                        fontFamily: 'Ubuntu',
                        color: Color(0xff232323),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Рейтинг',
                          style: FontStyles.regularStyle(
                            fontSize: 15,
                            fontFamily: 'Ubuntu',
                            color: Color(0xff232323),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                '4.5',
                                style: FontStyles.lightStyle(
                                  fontSize: 15,
                                  fontFamily: 'Ubuntu',
                                  color: Color(0xff232323),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                size: 15,
                                color: Color(0xff9F111B),
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        } else {
          print(ppController.isLoading.value);
          print(ppController.profileList.first.phone);
          return Center(
            child: Text('Error'),
          );
        }
      }),
    );
  }
}

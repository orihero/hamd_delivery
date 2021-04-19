import 'dart:io';

import 'package:HAMD_Delivery/constants/api.dart';
import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as g;

class SendFormButton extends StatelessWidget {
  const SendFormButton({
    Key key,
    @required this.nameController,
    @required this.phoneController,
    @required File userImage,
    @required File drivingPassport,
    @required this.drivingLicence,
    @required this.dio,
    @required this.userController,
  })  : _userImage = userImage,
        _drivingPassport = drivingPassport,
        super(key: key);

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final File _userImage;
  final File _drivingPassport;
  final File drivingLicence;
  final Dio dio;
  final UserProfileController userController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
      child: Container(
        height: 54,
        width: double.infinity,
        child: RaisedButton(
          elevation: 0,
          color: ColorPalatte.strongRedColor,
          onPressed: () async {
            FormData formData = FormData.fromMap({
              'name': nameController.text,
              'phone': phoneController.text,
            });
            if (_userImage != null) {
              String fileName = _userImage.path.split('/').last;
              formData.files.addAll([
                MapEntry(
                  "photo",
                  await MultipartFile.fromFile(
                    _userImage.path,
                    filename: fileName,
                  ),
                ),
              ]);
            }

            if (_drivingPassport != null) {
              String fileName = _drivingPassport.path.split('/').last;
              formData.files.addAll([
                MapEntry(
                  "passport",
                  await MultipartFile.fromFile(
                    _drivingPassport.path,
                    filename: fileName,
                  ),
                ),
              ]);
            }
            if (drivingLicence != null) {
              String fileName = drivingLicence.path.split('/').last;
              formData.files.addAll([
                MapEntry(
                  "driver_license",
                  await MultipartFile.fromFile(
                    drivingLicence.path,
                    filename: fileName,
                  ),
                ),
              ]);
            }
            final token = MyPref.secondToken;
            var response = await dio.post(
              ApiUrl.updateProfile,
              data: formData,
              options: Options(
                headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
              ),
            );
            if (response.statusCode == 200) {
              print('okayy');
              g.Get.snackbar(null, null,
                  messageText: Text(
                    'Ваши данные сохранены!',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Color(0xff007E33));
              userController.fetchProfileData();
            }
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Text(
            'СОХРАНИТЬ ИЗМЕНЕНИЯ',
            style: FontStyles.boldStyle(
                fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
          ),
        ),
      ),
    );
  }
}

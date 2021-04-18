import 'dart:io';

import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/ui/settings/profile_settings/widgets/profile_appbar.dart';
import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';

import 'widgets/image_change.dart';
import 'widgets/name_change.dart';
import 'widgets/phone_form.dart';

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final UserProfileController userController =
      g.Get.find<UserProfileController>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final picker = ImagePicker();
  Dio dio = Dio();
  File _userImage;
  File drivingLicence;
  File _drivingPassport;

  Future getdrivingLicencee() async {
    final pickedDrivingLicence =
        await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingLicence != null) {
        drivingLicence = File(pickedDrivingLicence.path);
        print(drivingLicence);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getdrivingPassport() async {
    final pickedDrivingCertificate =
        await picker.getImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedDrivingCertificate != null) {
          _drivingPassport = File(pickedDrivingCertificate.path);
        } else {
          print('No Image Selected');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: buildProfleSettingsAppBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
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
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 33, bottom: 45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      UserImageChange(
                        userImage: _userImage,
                        userController: userController,
                      ),
                      UserNameChange(nameController: nameController),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 35.0, bottom: 10.0),
                    child: Text(
                      'Ваш номер телефона',
                      style: FontStyles.regularStyle(
                        fontSize: 15,
                        fontFamily: 'Montserrat',
                        color: Color(0xffAAAEB7),
                      ),
                    ),
                  ),
                  UserPhonForm(phoneController: phoneController),
                  SizedBox(height: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Водительское удостоверение',
                        style: FontStyles.regularStyle(
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          color: Color(0xffAAAEB7),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            child: drivingLicence == null
                                ? GestureDetector(
                                    onTap: getdrivingLicencee,
                                    child: Container(
                                      child: Icon(
                                        Icons.add,
                                        size: 35,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 140,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          drivingLicence,
                                        ),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Паспорт',
                        style: FontStyles.regularStyle(
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          color: Color(0xffAAAEB7),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            child: _drivingPassport == null
                                ? GestureDetector(
                                    onTap: getdrivingPassport,
                                    child: Container(
                                      child: Icon(
                                        Icons.add,
                                        size: 35,
                                      ),
                                    ),
                                  )
                                : Container(
                                    height: 140,
                                    // radius: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          _drivingPassport,
                                          scale: 1.0,
                                          // height: 140,
                                        ),
                                        fit: BoxFit.scaleDown,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15.0),
                  GestureDetector(
                    onTap: () {
                      g.Get.bottomSheet(Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(
                              top: 10,
                              left: 20,
                              right: 20,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  ' Добавить новую карту',
                                  style: FontStyles.mediumStyle(
                                    fontSize: 20,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff0E0E0E),
                                  ),
                                ),
                                Text('sss'),
                              ],
                            ),
                          )
                        ],
                      ));
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 40),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Добавить карту',
                              style: FontStyles.regularStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                color: Color(0xff232323),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Icon(
                              Icons.add_circle_outline,
                              size: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

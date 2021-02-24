import 'dart:io';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String _phoneNumber = "998905858565";

  var controllerNumber =
      MaskedTextController(mask: '000 (00) 000 00 00', text: '+998 ');

  File _userImage;
  File _drivingLicence;
  File _drivingCertificate;

  final userImagePicker = ImagePicker();
  final drivingLicencePicker = ImagePicker();
  final drivingCertificatePicker = ImagePicker();

  Future getUserImage() async {
    final pickedUserImage =
        await userImagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedUserImage != null) {
        _userImage = File(pickedUserImage.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getdrivingLicencee() async {
    final pickedDrivingLicence =
        await drivingLicencePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingLicence != null) {
        _drivingLicence = File(pickedDrivingLicence.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getdrivingCertificate() async {
    final pickedDrivingCertificate =
        await drivingCertificatePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingCertificate != null) {
        _drivingCertificate = File(pickedDrivingCertificate.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
        child: customAppBar(
          context,
          title: 'Мой профиль',
          onpress1: () => Get.back(),
        ),
        preferredSize: Size.fromHeight(
            kToolbarHeight + MediaQuery.of(context).viewPadding.top),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 33, bottom: 45),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Container(
                              height: 95,
                              width: 95,
                              child: _userImage == null
                                  ? CircleAvatar(
                                      child: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: getUserImage,
                                      ),
                                    )
                                  : CircleAvatar(
                                      child: Image.file(_userImage),
                                    ),
                            ),
                            _userImage == null
                                ? Container()
                                : Positioned(
                                    right: 25,
                                    bottom: -10,
                                    child: Container(
                                      width: 36,
                                      height: 36,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                      ),
                                      child: IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            color: Color(0xff575F6B),
                                            size: 25,
                                          ),
                                          onPressed: null),
                                    ),
                                  ),
                          ],
                        )),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Имя',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                          Text(
                            'Фарход',
                            style: FontStyles.mediumStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text(
                            'Фамилия',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                          Text(
                            'Мирмахмудов',
                            style: FontStyles.mediumStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35),
                Text(
                  'Ваш номер телефона',
                  style: FontStyles.regularStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                    color: Color(0xffAAAEB7),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(15)),
                  height: 55.0,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(
                          Icons.phone_android,
                          color: Colors.grey,
                        ),
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: controllerNumber..text = '998909858565',
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 15.0),
                            hintText: 'Введите свой номер телефона',
                            hintStyle: FontStyles.regularStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu',
                                color: Color(0xff9E9E9E)),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                          ),
                          onSaved: (input) => _phoneNumber = input,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Водит.удостоверение',
                            style: FontStyles.regularStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xffAAAEB7),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: _drivingCertificate == null
                                    ? IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: getdrivingCertificate,
                                      )
                                    : Image.file(_userImage),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Паспорт',
                            style: FontStyles.regularStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xffAAAEB7),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                child: _drivingCertificate == null
                                    ? Container(
                                        child: IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: getdrivingLicencee,
                                        ),
                                      )
                                    : Image.asset('assets/images/prava.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Spacer(),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 40),
            child: Container(
              height: 54,
              width: double.infinity,
              child: RaisedButton(
                elevation: 0,
                color: ColorPalatte.strongRedColor,
                onPressed: () => Get.back(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Text(
                  'СОХРАНИТЬ ИЗМЕНЕНИЯ',
                  style: FontStyles.boldStyle(
                      fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

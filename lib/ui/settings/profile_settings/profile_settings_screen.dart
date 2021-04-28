import 'dart:io';

import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/services/add_plastic_card.dart';
import 'package:HAMD_Delivery/ui/masks/masks.dart';
import 'package:HAMD_Delivery/ui/settings/profile_settings/widgets/profile_appbar.dart';
import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart' as g;
import 'package:image_picker/image_picker.dart';

import 'widgets/name_change.dart';
import 'widgets/payment_card.dart';
import 'widgets/phone_form.dart';
import 'widgets/send_form_button.dart';

class ProfileSettingsScreen extends StatefulWidget {
  @override
  _ProfileSettingsScreenState createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final UserProfileController userController =
      g.Get.find<UserProfileController>();
  final PlasticCardHumoController plasticCardHumoController =
      g.Get.find<PlasticCardHumoController>();
  final PlasticCardTypeController plasticCardUzcardController =
      g.Get.find<PlasticCardTypeController>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController humoCardController = TextEditingController();
  TextEditingController uzCardController = TextEditingController();
  TextEditingController dateHumoController = TextEditingController();
  TextEditingController dateUzCardController = TextEditingController();
  TextEditingController phoneHumoController = TextEditingController();
  TextEditingController phoneUzCardController = TextEditingController();

  final uzCard = 1;
  final humoCard = 2;
  Dio dio = Dio();
  File _userImage;
  File drivingLicence;
  File _drivingPassport;
  int selectedRadio;
  final picker = ImagePicker();
  final drivingPicker = ImagePicker();
  final passportPicker = ImagePicker();

  Map<int, Map<String, String>> chooseCardModalData = {
    0: {
      'name': 'Uzcard',
      'image': 'assets/icons/uzcard.svg',
    },
    1: {
      'name': 'Humo',
      'image': 'assets/images/humo.png',
    },
  };

  Future getUserImage() async {
    final pickedUserImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedUserImage != null) {
      setState(() {
        _userImage = File(pickedUserImage.path);
      });
    } else {
      print('No Image Selected');
    }
  }

  Future getdrivingLicencee() async {
    final pickedDrivingLicence =
        await drivingPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingLicence != null) {
        drivingLicence = File(pickedDrivingLicence.path);
      } else {
        print('No Image Selected');
      }
    });
  }

  Future getdrivingPassport() async {
    final pickedDrivingCertificate =
        await passportPicker.getImage(source: ImageSource.gallery);
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
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await plasticCardUzcardController.fetchPlasticCardType(14);
    await plasticCardHumoController.fetchPlasticCardHumo(15);
    setState(() {
      if (plasticCardUzcardController.plasticCardTypeList.isNotEmpty) {
        print(plasticCardUzcardController.plasticCardTypeList.first.cardNumber);
        uzCardController.text =
            plasticCardUzcardController.plasticCardTypeList.first.cardNumber;
        dateUzCardController.text =
            plasticCardUzcardController.plasticCardTypeList.first.cardExpire;
        phoneUzCardController.text = plasticCardUzcardController
            .plasticCardTypeList.first.cardPhoneNumber;
      }
      if (plasticCardHumoController.plasticCardTypeList.isNotEmpty) {
        humoCardController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardNumber;
        dateHumoController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardExpire;
        phoneHumoController.text =
            plasticCardHumoController.plasticCardTypeList.first.cardPhoneNumber;
      }
    });
  }

  @override
  void initState() {
    nameController..text = userController.profileList.first.name;
    phoneController..text = userController.profileList.first.phone.toString();
    super.initState();
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
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: getUserImage,
                          child: Stack(
                            overflow: Overflow.visible,
                            children: [
                              Container(
                                height: 95,
                                width: 95,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: _userImage == null
                                    ? CircleAvatar(
                                        radius: 60,
                                        backgroundImage: NetworkImage(
                                          'http://hamd.loko.uz/' +
                                              userController
                                                  .profileList.first.photo,
                                        ),
                                      )
                                    : CircleAvatar(
                                        radius: 60,
                                        backgroundImage: FileImage(_userImage),
                                      ),
                              ),
                              Positioned(
                                right: 25,
                                bottom: -10,
                                child: Container(
                                  width: 36,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    color: Color(0xff575F6B),
                                    size: 25,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                          child: g.Obx(
                            () {
                              return Container(
                                child: drivingLicence == null
                                    ? GestureDetector(
                                        onTap: getdrivingLicencee,
                                        child: userController.profileList.first
                                                    .driverLicensePhoto ==
                                                null
                                            ? Container(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 35,
                                                ),
                                              )
                                            : Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'http://hamd.loko.uz/' +
                                                          userController
                                                              .profileList
                                                              .first
                                                              .driverLicensePhoto,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                      )
                                    : Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              drivingLicence,
                                              scale: 1.0,
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                              );
                            },
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
                          child: g.Obx(
                            () {
                              return Container(
                                child: _drivingPassport == null
                                    ? GestureDetector(
                                        onTap: getdrivingPassport,
                                        child: userController.profileList.first
                                                    .passportPhoto ==
                                                null
                                            ? Container(
                                                child: Icon(
                                                  Icons.add,
                                                  size: 35,
                                                ),
                                              )
                                            : Container(
                                                height: 140,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      'http://hamd.loko.uz/' +
                                                          userController
                                                              .profileList
                                                              .first
                                                              .passportPhoto,
                                                    ),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                      )
                                    : Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: FileImage(
                                              _drivingPassport,
                                              scale: 1.0,
                                            ),
                                            fit: BoxFit.scaleDown,
                                          ),
                                        ),
                                      ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            g.Obx(
              () {
                if (plasticCardUzcardController.isLoading.value ||
                    plasticCardHumoController.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (plasticCardUzcardController.plasticCardTypeList.isEmpty &&
                    plasticCardHumoController.plasticCardTypeList.isEmpty) {
                  return GestureDetector(
                    onTap: buildChooseModal,
                    child: Card(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0)
                          .copyWith(bottom: 20.0),
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
                  );
                }
                return Column(
                  children: List.generate(2, (index) {
                    if (plasticCardUzcardController
                            .plasticCardTypeList.isEmpty ||
                        plasticCardHumoController.plasticCardTypeList.isEmpty) {
                      if (index == 1) {
                        return GestureDetector(
                          onTap: buildChooseModal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
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
                        );
                      }
                    }
                    if (plasticCardUzcardController
                        .plasticCardTypeList.isNotEmpty) if (index == 0) {
                      return PaymentCard(
                        isUzCard: true,
                        plasticCardUzcardController:
                            plasticCardUzcardController,
                        uzCardController: uzCardController,
                        humoCardController: humoCardController,
                        dateUzCardController: dateUzCardController,
                        dateHumoController: dateHumoController,
                        phoneUzCardController: phoneUzCardController,
                        phoneHumoController: phoneHumoController,
                        nameController: nameController,
                        plasticId: plasticCardUzcardController
                            .plasticCardTypeList.first.id,
                        editFunction: buildCardChange,
                      );
                    }
                    if (plasticCardHumoController
                        .plasticCardTypeList.isNotEmpty)
                      return PaymentCard(
                        isUzCard: false,
                        plasticCardUzcardController:
                            plasticCardUzcardController,
                        uzCardController: uzCardController,
                        humoCardController: humoCardController,
                        dateUzCardController: dateUzCardController,
                        dateHumoController: dateHumoController,
                        phoneUzCardController: phoneUzCardController,
                        phoneHumoController: phoneHumoController,
                        nameController: nameController,
                        plasticId: plasticCardHumoController
                            .plasticCardTypeList.first.id,
                        editFunction: buildCardChange,
                      );
                    return Text('');
                  }),
                );
              },
            ),
            SendFormButton(
                nameController: nameController,
                phoneController: phoneController,
                userImage: _userImage,
                drivingPassport: _drivingPassport,
                drivingLicence: drivingLicence,
                dio: dio,
                userController: userController),
          ],
        ),
      ),
    );
  }

  buildChooseModal() {
    g.Get.bottomSheet(
      StatefulBuilder(
        builder: (context, state) => Column(
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
                    'Добавить новую карту',
                    style: FontStyles.mediumStyle(
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      color: Color(0xff0E0E0E),
                    ),
                  ),
                  Column(
                    children: List.generate(
                      chooseCardModalData.length,
                      (index) => Row(
                        children: <Widget>[
                          Container(
                            child: index == 0
                                ? SvgPicture.asset(
                                    chooseCardModalData[index]['image'],
                                    width: 40,
                                  )
                                : Image.asset(
                                    chooseCardModalData[index]['image'],
                                    width: 40,
                                  ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: Color(0xffFFBC41),
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: index == 0 ? uzCard : humoCard,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                setState(() {
                                  selectedRadio = val;
                                });
                                g.Get.back();
                                buildCardChange();
                              },
                              title: Text(
                                chooseCardModalData[index]['name'],
                                style: FontStyles.mediumStyle(
                                  fontSize: 18,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff0E0E0E),
                                ),
                              ),
                            ),
                          ),
                        ],
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

  buildCardChange() {
    g.Get.bottomSheet(
      Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(builder: (context, StateSetter state) {
              return Container(
                padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Добавление карты',
                        style: FontStyles.regularStyle(
                          fontSize: 17,
                          fontFamily: 'Montserrat',
                          color: Color(0xff232323),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 18, vertical: 17),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Номер карты',
                                  style: FontStyles.regularStyle(
                                    fontSize: 13,
                                    fontFamily: 'Montserrat',
                                    color: Color(0xff646974),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 5),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 0.0),
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFFFFFF),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        width: 1,
                                        color: Color(0xffE1E1E1),
                                      )),
                                  child: TextFormField(
                                    controller: selectedRadio == uzCard
                                        ? uzCardController
                                        : humoCardController,
                                    inputFormatters: [
                                      selectedRadio == uzCard
                                          ? InputMask.maskUzCard
                                          : InputMask.maskHumo
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 8.0, bottom: 2, top: 2),
                                      hintText: selectedRadio == uzCard
                                          ? '8600'
                                          : '9860',
                                      hintStyle: FontStyles.regularStyle(
                                          fontSize: 16,
                                          fontFamily: 'Ubuntu',
                                          color: Color(0xff9E9E9E)),
                                      border: InputBorder.none,
                                    ),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return "поле не может быть пустым";
                                      } else if (value.length < 19) {
                                        return 'поле не может быть меньше 16 цифр';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'год/месяц',
                                            style: FontStyles.regularStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff646974),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10.0),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xffE1E1E1),
                                                )),
                                            child: TextFormField(
                                              controller:
                                                  selectedRadio == uzCard
                                                      ? dateUzCardController
                                                      : dateHumoController,
                                              inputFormatters: [
                                                InputMask.maskDate
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 8.0,
                                                        bottom: 2,
                                                        top: 2),
                                                hintText: '08/24',
                                                hintStyle:
                                                    FontStyles.regularStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Ubuntu',
                                                        color:
                                                            Color(0xff9E9E9E)),
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "поле не может быть пустым";
                                                } else if (value.length < 5) {
                                                  return 'поле не может быть меньше 4 цифр';
                                                }
                                                return null;
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      flex: 8,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'номер телефона',
                                            style: FontStyles.regularStyle(
                                              fontSize: 13,
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff646974),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(top: 5),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0.0),
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFFFFFF),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                border: Border.all(
                                                  width: 1,
                                                  color: Color(0xffE1E1E1),
                                                )),
                                            child: TextFormField(
                                              controller:
                                                  selectedRadio == uzCard
                                                      ? phoneUzCardController
                                                      : phoneHumoController,
                                              inputFormatters: [
                                                InputMask.maskPhoneNumber
                                              ],
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 8.0,
                                                        bottom: 2,
                                                        top: 2),
                                                hintText: '+998',
                                                border: InputBorder.none,
                                              ),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.0,
                                              ),
                                              validator: (value) {
                                                if (value.isEmpty) {
                                                  return "поле не может быть пустым";
                                                } else if (value.length < 17) {
                                                  return 'поле не может быть меньше 12 цифр';
                                                }
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 54,
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          color: ColorPalatte.strongRedColor,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await AddPlasticCardType.addPlasticCardType(
                                typeId: selectedRadio == uzCard ? 14 : 15,
                                cardNumber: selectedRadio == uzCard
                                    ? uzCardController.text
                                    : humoCardController.text,
                                cardPhoneNumber: selectedRadio == uzCard
                                    ? phoneUzCardController.text
                                    : phoneHumoController.text,
                                cardExpire: selectedRadio == uzCard
                                    ? dateUzCardController.text
                                    : dateHumoController.text,
                              );
                              await plasticCardUzcardController
                                  .fetchPlasticCardType(14);
                              await plasticCardHumoController
                                  .fetchPlasticCardHumo(15);
                            } else {
                              print('no');
                            }
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            'ДОБАВИТЬ',
                            style: FontStyles.boldStyle(
                                fontSize: 16,
                                fontFamily: 'Ubuntu',
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
      isScrollControlled: true,
    );
  }
}

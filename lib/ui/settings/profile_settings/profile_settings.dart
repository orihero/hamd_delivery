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
  int cardNumber = 0;
  String cardDetail;
  String expireDate;
  String phoneNumber;

  int selectedRadio;
  int selectedCard;
  int ssCard;

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

  String nameValue;
  MaskedTextController cardNumberConteoller =
      MaskedTextController(mask: '0000 0000 0000 0000');

  MaskedTextController uzCardNumberConteoller =
      MaskedTextController(mask: '0000 0000 0000 0000', text: '8600');
  MaskedTextController humoCardNumberConteoller =
      MaskedTextController(mask: '0000 0000 0000 0000', text: '9860');

  MaskedTextController expireController = MaskedTextController(mask: '00/00');
  MaskedTextController phoneNumberController =
      MaskedTextController(mask: '000 00 000 00 00', text: '998');

  TextEditingController nameController = TextEditingController();
  final globalKey = GlobalKey<ScaffoldState>();
  String _phoneNumber = "998905858565";

  var controllerNumber =
      MaskedTextController(mask: '000 (00) 000 00 00', text: '+998 ');
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();

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
      resizeToAvoidBottomPadding: false,
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
      body: SingleChildScrollView(
        child: Column(
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
              padding:
                  EdgeInsets.only(left: 15, right: 15, top: 33, bottom: 45),
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
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: _userImage == null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: SvgPicture.asset(
                                            'assets/icons/avatar.svg'),
                                      )
                                    : Container(
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white,
                                            image: DecorationImage(
                                                image: Image.file(_userImage)
                                                    .image,
                                                fit: BoxFit.cover)),
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
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(0xff575F6B),
                                        size: 25,
                                      ),
                                      onPressed: getUserImage),
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
                            TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 15.0),
                                hintText: 'Введите ваше имя',
                                hintStyle: FontStyles.regularStyle(
                                    fontSize: 17,
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xff232323)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
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
                            TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.only(left: 15.0),
                                hintText: 'Введите ваше фамилию',
                                hintStyle: FontStyles.regularStyle(
                                    fontSize: 17,
                                    fontFamily: 'Ubuntu',
                                    color: Color(0xff232323)),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
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
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            child: _drivingCertificate == null
                                ? IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 35,
                                    ),
                                    onPressed: getdrivingCertificate,
                                  )
                                : Image.file(
                                    _drivingCertificate,
                                    height: 140,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: 15,
                  ),

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
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            child: _drivingLicence == null
                                ? Container(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        size: 35,
                                      ),
                                      onPressed: getdrivingLicencee,
                                    ),
                                  )
                                : Image.file(
                                    _drivingLicence,
                                    width: MediaQuery.of(context).size.width,
                                    height: 140,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Stack(
                      children: [
                        Positioned(
                            child: Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: cardNumber == 1
                                ? Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                              padding: EdgeInsets.only(
                                                  top: 11, bottom: 11),
                                              child: ssCard == 1
                                                  ? SvgPicture.asset(
                                                      'assets/icons/uzcard.svg',
                                                      height: 30,
                                                    )
                                                  : SvgPicture.asset(
                                                      'assets/icons/humo.svg',
                                                      height: 30,
                                                    )),
                                          Row(
                                            children: [
                                              Text(
                                                ssCard == 1
                                                    ? uzCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(0, 4)
                                                    : humoCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(0, 4),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                ssCard == 1
                                                    ? uzCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(4, 8)
                                                    : humoCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(4, 8),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                ssCard == 1
                                                    ? uzCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(8, 12)
                                                    : humoCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(8, 12),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                ssCard == 1
                                                    ? uzCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(12, 19)
                                                    : humoCardNumberConteoller
                                                        .text
                                                        .toString()
                                                        .substring(12, 19),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    'год/месяц',
                                                    style:
                                                        FontStyles.regularStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xff646974),
                                                    ),
                                                  ),
                                                  Text(
                                                    expireController.text
                                                        .toString(),
                                                    style: FontStyles.boldStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xff646974),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  Text(
                                                    'номер телефона',
                                                    style:
                                                        FontStyles.regularStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xff646974),
                                                    ),
                                                  ),
                                                  Text(
                                                    '+' +
                                                        phoneNumberController
                                                            .text
                                                            .toString(),
                                                    style: FontStyles.boldStyle(
                                                      fontSize: 13,
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xff646974),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 15),
                                              child: Text(
                                                'Фарход Мирмахмудов',
                                                style: FontStyles.regularStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * .9,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 40),
                                      child: Column(
                                        children: [
                                          Text(
                                            'Добавить карту',
                                            style: FontStyles.regularStyle(
                                              fontSize: 17,
                                              fontFamily: 'Montserrat',
                                              color: Color(0xff232323),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          IconButton(
                                            icon: Icon(
                                              Icons.add_circle_outline,
                                              size: 50,
                                            ),
                                            onPressed: () {
                                              ////////////////////////////////////
                                              ////////////////////////////////////
                                              /////////First Modal BottomShit/////
                                              /////////////////////////////////////
                                              //////////////////////////////////
                                              //////////////////////////////////////

                                              showModalBottomSheet(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(20),
                                                    topRight:
                                                        Radius.circular(20),
                                                  ),
                                                ),
                                                context: context,
                                                builder: (context) {
                                                  return StatefulBuilder(
                                                    builder: (context,
                                                        StateSetter state) {
                                                      return Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 10,
                                                                left: 20,
                                                                right: 20),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              ' Добавить новую карту',
                                                              style: FontStyles
                                                                  .mediumStyle(
                                                                fontSize: 20,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xff0E0E0E),
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child:
                                                                      SvgPicture
                                                                          .asset(
                                                                    'assets/icons/uzcard.svg',
                                                                    width: 40,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      RadioListTile(
                                                                    activeColor:
                                                                        Color(
                                                                            0xffFFBC41),
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                    value: 1,
                                                                    groupValue:
                                                                        selectedRadio,
                                                                    onChanged:
                                                                        (val) {
                                                                      print(
                                                                          'Radio $val');
                                                                      if (selectedCard ==
                                                                          2) {
                                                                        setState(
                                                                            () {
                                                                          selectedCard =
                                                                              1;
                                                                          ssCard =
                                                                              val;
                                                                          print(
                                                                              'your ssCard : $ssCard');
                                                                        });
                                                                        print(
                                                                            'your selecte Card: $selectedCard');
                                                                      }
                                                                      state(() {
                                                                        print(
                                                                            'your selected radio is: $selectedRadio');
                                                                        ssCard =
                                                                            val;
                                                                        print(
                                                                            'your ssCard : $ssCard');
                                                                        selectedRadioValue(
                                                                            val);
                                                                      });

                                                                      ////////////////////////////////////
                                                                      ////////////////////////////////////
                                                                      /////////Second Modal BottomShit/////
                                                                      /////////////////////////////////////
                                                                      //////////////////////////////////
                                                                      //////////////////////////////////////

                                                                      Get.back();
                                                                      showModalBottomSheet(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                            ),
                                                                          ),
                                                                          isScrollControlled:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
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
                                                                                          style: FontStyles.boldStyle(
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
                                                                                              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
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
                                                                                                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                                                                    decoration: BoxDecoration(
                                                                                                        color: const Color(0xffFFFFFF),
                                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                                        border: Border.all(
                                                                                                          width: 1,
                                                                                                          color: Color(0xffE1E1E1),
                                                                                                        )),
                                                                                                    child: TextFormField(
                                                                                                      controller: uzCardNumberConteoller,
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      decoration: InputDecoration(
                                                                                                        contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                        // hintText: '0000 0000 0000 0000',
                                                                                                        hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                        border: InputBorder.none,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.black,
                                                                                                        fontSize: 16.0,
                                                                                                      ),
                                                                                                      onSaved: (input) => nameValue = input,
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
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                                                                              decoration: BoxDecoration(
                                                                                                                  color: const Color(0xffFFFFFF),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                  border: Border.all(
                                                                                                                    width: 1,
                                                                                                                    color: Color(0xffE1E1E1),
                                                                                                                  )),
                                                                                                              child: TextFormField(
                                                                                                                controller: expireController,
                                                                                                                keyboardType: TextInputType.number,
                                                                                                                decoration: InputDecoration(
                                                                                                                  contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                  // hintText:
                                                                                                                  //     '08/24',
                                                                                                                  hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                                  border: InputBorder.none,
                                                                                                                ),
                                                                                                                style: TextStyle(
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 16.0,
                                                                                                                ),
                                                                                                                onSaved: (input) => expireDate = input,
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
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                                                                              decoration: BoxDecoration(
                                                                                                                  color: const Color(0xffFFFFFF),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                  border: Border.all(
                                                                                                                    width: 1,
                                                                                                                    color: Color(0xffE1E1E1),
                                                                                                                  )),
                                                                                                              child: TextFormField(
                                                                                                                controller: phoneNumberController,
                                                                                                                keyboardType: TextInputType.number,
                                                                                                                decoration: InputDecoration(
                                                                                                                  contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                  // hintText:
                                                                                                                  //     hintText,
                                                                                                                  hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                                  border: InputBorder.none,
                                                                                                                ),
                                                                                                                style: TextStyle(
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 16.0,
                                                                                                                ),
                                                                                                                onSaved: (input) => phoneNumber = input,
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
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                ++cardNumber;
                                                                                              });
                                                                                              print('index is: $cardNumber');

                                                                                              // Scaffold.of(context).hideCurrentSnackBar();
                                                                                              Get.back();
                                                                                            },
                                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                            child: Text(
                                                                                              'ДОБАВИТЬ',
                                                                                              style: FontStyles.boldStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          });

                                                                      //////////////////////////////////////
                                                                      //////////////////////////////////////
                                                                      ////////////End of Second/////////////
                                                                      /////////////////////////////////////
                                                                    },
                                                                    title: Text(
                                                                      'UzCard',
                                                                      style: FontStyles
                                                                          .mediumStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xff0E0E0E),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Container(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/humo.png',
                                                                    width: 40,
                                                                  ),
                                                                ),
                                                                Expanded(
                                                                  child:
                                                                      RadioListTile(
                                                                    activeColor:
                                                                        Color(
                                                                            0xffFFBC41),
                                                                    controlAffinity:
                                                                        ListTileControlAffinity
                                                                            .trailing,
                                                                    value: 2,
                                                                    groupValue:
                                                                        selectedRadio,
                                                                    onChanged:
                                                                        (val) {
                                                                      if (selectedCard ==
                                                                          1) {
                                                                        setState(
                                                                            () {
                                                                          selectedCard =
                                                                              2;
                                                                          ssCard =
                                                                              val;
                                                                          print(
                                                                              'your ssCard : $ssCard');
                                                                        });
                                                                        print(
                                                                            'your selecte Card: $selectedCard');
                                                                      }
                                                                      state(() {
                                                                        print(
                                                                            'your selected radio is: $selectedRadio');
                                                                        selectedRadioValue(
                                                                            val);
                                                                        ssCard =
                                                                            val;
                                                                        print(
                                                                            'your ssCard : $ssCard');
                                                                      });
                                                                      print(
                                                                          'Radio $val');
                                                                      selectedRadioValue(
                                                                          val);

                                                                      //////////////////////////////////////////
                                                                      /////////////////////////////////////////
                                                                      /////////////THird ModalShitt//////////////
                                                                      //////////////////////////////////////////

                                                                      Get.back();
                                                                      showModalBottomSheet(
                                                                          shape:
                                                                              RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                            ),
                                                                          ),
                                                                          isScrollControlled:
                                                                              true,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return Padding(
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
                                                                                              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 17),
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
                                                                                                    padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                                                                    decoration: BoxDecoration(
                                                                                                        color: const Color(0xffFFFFFF),
                                                                                                        borderRadius: BorderRadius.circular(15),
                                                                                                        border: Border.all(
                                                                                                          width: 1,
                                                                                                          color: Color(0xffE1E1E1),
                                                                                                        )),
                                                                                                    child: TextFormField(
                                                                                                      controller: humoCardNumberConteoller,
                                                                                                      keyboardType: TextInputType.number,
                                                                                                      decoration: InputDecoration(
                                                                                                        contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                        // hintText: '0000 0000 0000 0000',
                                                                                                        hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                        border: InputBorder.none,
                                                                                                      ),
                                                                                                      style: TextStyle(
                                                                                                        color: Colors.black,
                                                                                                        fontSize: 16.0,
                                                                                                      ),
                                                                                                      onSaved: (input) => nameValue = input,
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
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                                                                                              decoration: BoxDecoration(
                                                                                                                  color: const Color(0xffFFFFFF),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                  border: Border.all(
                                                                                                                    width: 1,
                                                                                                                    color: Color(0xffE1E1E1),
                                                                                                                  )),
                                                                                                              child: TextFormField(
                                                                                                                controller: expireController,
                                                                                                                keyboardType: TextInputType.number,
                                                                                                                decoration: InputDecoration(
                                                                                                                  contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                  // hintText:
                                                                                                                  //     '08/24',
                                                                                                                  hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                                  border: InputBorder.none,
                                                                                                                ),
                                                                                                                style: TextStyle(
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 16.0,
                                                                                                                ),
                                                                                                                onSaved: (input) => expireDate = input,
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
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                                                                                              padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                                                                                              decoration: BoxDecoration(
                                                                                                                  color: const Color(0xffFFFFFF),
                                                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                                                  border: Border.all(
                                                                                                                    width: 1,
                                                                                                                    color: Color(0xffE1E1E1),
                                                                                                                  )),
                                                                                                              child: TextFormField(
                                                                                                                controller: phoneNumberController,
                                                                                                                keyboardType: TextInputType.number,
                                                                                                                decoration: InputDecoration(
                                                                                                                  contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                  // hintText:
                                                                                                                  //     hintText,
                                                                                                                  hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
                                                                                                                  border: InputBorder.none,
                                                                                                                ),
                                                                                                                style: TextStyle(
                                                                                                                  color: Colors.black,
                                                                                                                  fontSize: 16.0,
                                                                                                                ),
                                                                                                                onSaved: (input) => phoneNumber = input,
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
                                                                                            onPressed: () {
                                                                                              setState(() {
                                                                                                ++cardNumber;
                                                                                              });
                                                                                              print('index is: $cardNumber');

                                                                                              // Scaffold.of(context).hideCurrentSnackBar();
                                                                                              Get.back();
                                                                                            },
                                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                                                                            child: Text(
                                                                                              'ДОБАВИТЬ',
                                                                                              style: FontStyles.boldStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Colors.white),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }),
                                                                            );
                                                                          });

                                                                      //////////////////////////////////////////
                                                                      /////////////////////////////////////////
                                                                      /////////////End Third ModalShitt//////////////
                                                                      //////////////////////////////////////////
                                                                    },
                                                                    title: Text(
                                                                      'Humo',
                                                                      style: FontStyles
                                                                          .mediumStyle(
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: Color(
                                                                            0xff0E0E0E),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                          ),
                        ))
                      ],
                    ),
                  ),

                  // Spacer(),
                ],
              ),
            ),
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
                        fontSize: 16,
                        fontFamily: 'Ubuntu',
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

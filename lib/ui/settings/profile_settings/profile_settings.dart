import 'dart:io';

import 'package:HAMD_Delivery/constants/api.dart';
import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';
import 'package:HAMD_Delivery/controllers/profile_controller.dart';
import 'package:HAMD_Delivery/services/add_plastic_card.dart';
import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';
import 'package:HAMD_Delivery/ui/masks/masks.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart' as g;
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  String cardDetail;
  int cardNumber = 0;
  var controllerNumber =
      MaskedTextController(mask: '000 (00) 000 00 00', text: '+998 ');

  TextEditingController dateController = TextEditingController();
  TextEditingController dateHumoController = TextEditingController();
  Dio dio = Dio();
  final drivingLicencePicker = ImagePicker();
  final drivingPassportPicker = ImagePicker();
  String expireDate;
  // TextEditingController expireDateController = TextEditingController();
  TextEditingController fname = TextEditingController();
  // TextEditingController humoController = TextEditingController();
  TextEditingController humoController = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController phoneHumoController = TextEditingController();
  String phoneNumber;
  TextEditingController phoneUzController = TextEditingController();
  final PlasticCardHumoController plasticCardHumoController =
      g.Get.find<PlasticCardHumoController>();

  final PlasticCardTypeController plasticCardTypeController =
      g.Get.find<PlasticCardTypeController>();

  int selectedCard;
  int selectedRadio;
  int ssCard;
  final userImagePicker = ImagePicker();
  final UserProfileController usrController =
      g.Get.find<UserProfileController>();

  // TextEditingController uzCardController = TextEditingController();
  TextEditingController uzCardController = TextEditingController();

  File _drivingLicence;
  File _drivingPassport;
  final _formKey = GlobalKey<FormState>();
  String _phoneNumber = "998905858565";
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  File _userImage;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await plasticCardTypeController.fetchPlasticCardType(14);
    await plasticCardHumoController.fetchPlasticCardHumo(15);
    setState(() {
      if (plasticCardTypeController.plasticCardTypeList.isNotEmpty) {
        print(plasticCardTypeController.plasticCardTypeList.first.cardNumber);
        uzCardController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardNumber;
        dateController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardExpire;
        phoneUzController.text =
            plasticCardTypeController.plasticCardTypeList.first.cardPhoneNumber;
      }
      if (plasticCardHumoController.plasticCardTypeList.isNotEmpty) {
        humoController.text =
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
    nameController..text = usrController.profileList.first.name;
    phoneController..text = usrController.profileList.first.phone.toString();
    super.initState();
  }

  selectedRadioValue(int val) {
    selectedRadio = val;
  }

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
    // FormData formData = FormData.fromMap({
    //   'name': nameController.text,
    //   'phone': phoneController.text,
    // });
    // if (_userImage != null) {
    //   print('user image pah');
    //   print(_userImage.path);
    //   String fileName = _userImage.path.split('/').last;
    //   formData.files.addAll([
    //     MapEntry(
    //       "photo",
    //       await MultipartFile.fromFile(
    //         _userImage.path,
    //         filename: fileName,
    //       ),
    //     ),
    //   ]);
    // }
    // final token = MyPref.secondToken;
    // var response = await dio.post(
    //   ApiUrl.updateProfile,
    //   data: formData,
    //   options: Options(
    //     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    //   ),
    // );
    // if (response.statusCode == 200) {
    //   print('okayy');
    //   g.Get.snackbar('ваши данные были успешно изменены', '',
    //       colorText: Colors.white, backgroundColor: Colors.grey[500]);
    //   usrController.fetchProfileData();
    // }
  }

  Future getdrivingLicencee() async {
    final pickedDrivingLicence =
        await drivingLicencePicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingLicence != null) {
        _drivingLicence = File(pickedDrivingLicence.path);
        print(_drivingLicence);
      } else {
        print('No Image Selected');
      }
    });
    // FormData formDataL = FormData.fromMap({
    //   'name': nameController.text,
    //   'phone': phoneController.text,
    // });
    // if (_drivingLicence != null) {
    //   print('driving licnec path');
    //   print(
    //     _drivingLicence.path,
    //   );
    //   String fileDL = _drivingLicence.path.split('/').last;
    //   formDataL.files.addAll([
    //     MapEntry(
    //       "driverLicensePhoto",
    //       await MultipartFile.fromFile(
    //         _drivingLicence.path,
    //         filename: fileDL,
    //       ),
    //     ),
    //   ]);
    // }
    // final token = MyPref.secondToken;
    // var response = await dio.post(
    //   ApiUrl.updateProfile,
    //   data: formDataL,
    //   options: Options(
    //     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    //   ),
    // );
    // if (response.statusCode == 200) {
    //   print('seocnd toke');
    //   print(token);
    //   print('okayy');
    //   g.Get.snackbar('ваши данные были успешно изменены', '',
    //       colorText: Colors.white, backgroundColor: Colors.grey[500]);
    //   usrController.fetchProfileData();
    // }
  }

  Future getdrivingPassport() async {
    final pickedDrivingCertificate =
        await drivingPassportPicker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedDrivingCertificate != null) {
        _drivingPassport = File(pickedDrivingCertificate.path);
      } else {
        print('No Image Selected');
      }
    });
    // FormData formDataP = FormData.fromMap({
    //   'name': nameController.text,
    //   'phone': phoneController.text,
    // });
    // if (_drivingPassport != null) {
    //   String fileP = _drivingPassport.path.split('/').last;
    //   formDataP.files.addAll([
    //     MapEntry(
    //       "passportPhoto",
    //       await MultipartFile.fromFile(
    //         _drivingPassport.path,
    //         filename: fileP,
    //       ),
    //     ),
    //   ]);
    // }
    // final token = MyPref.secondToken;
    // var response = await dio.post(
    //   ApiUrl.updateProfile,
    //   data: formDataP,
    //   options: Options(
    //     headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    //   ),
    // );
    // if (response.statusCode == 200) {
    //   print('seocnd toke');
    //   print(token);
    //   print('okayy');
    //   g.Get.snackbar('ваши данные были успешно изменены', '',
    //       colorText: Colors.white, backgroundColor: Colors.grey[500]);
    //   usrController.fetchProfileData();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorPalatte.mainPageColor,
      appBar: PreferredSize(
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: ColorPalatte.strongRedColor,
          elevation: 0,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 10),
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
                          onPressed: () => g.Get.back(),
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
                                  content:
                                      Text('Вы действительно хотите выйти?'),
                                  actions: [
                                    FlatButton(
                                      onPressed: () => g.Get.back(),
                                      child: Text('нет'),
                                    ),
                                    FlatButton(
                                      child: Text('да'),
                                      onPressed: () {
                                        MyPref.clearToken();
                                        MyPref.clearSecondToken();
                                        print('toke after exiting');
                                        print(MyPref.token);
                                        print('second toke after exiting');
                                        print(MyPref.secondToken);
                                        g.Get.offAll(LandingScreen());
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
                                          radius: 60,
                                          backgroundImage: NetworkImage(
                                            'http://hamd.loko.uz/' +
                                                usrController
                                                    .profileList.first.photo,
                                          ))
                                      : CircleAvatar(
                                          radius: 60,
                                          backgroundImage:
                                              FileImage(_userImage),
                                        )),
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
                              controller: nameController,
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
                            controller: phoneController,
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
                            child: _drivingPassport == null
                                ? IconButton(
                                    icon: Icon(
                                      Icons.add,
                                      size: 35,
                                    ),
                                    onPressed: getdrivingPassport,
                                  )
                                : Container(
                                    height: 140,
                                    // radius: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          _drivingPassport,
                                          // height: 140,
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
                                : Container(
                                    height: 140,
                                    // radius: 60,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: FileImage(
                                          _drivingLicence,
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
                              child: g.Obx(() {
                                if (plasticCardHumoController.isLoading.value ||
                                    plasticCardTypeController.isLoading.value) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else if (plasticCardHumoController
                                        .plasticCardTypeList.isEmpty ||
                                    plasticCardTypeController
                                        .plasticCardTypeList.isEmpty) {
                                  return Container(
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

                                                                      g.Get
                                                                          .back();
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
                                                                            return Form(
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
                                                                                                        controller: uzCardController,
                                                                                                        inputFormatters: [InputMask.maskUzCard],
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        decoration: InputDecoration(
                                                                                                          contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                          hintText: '8600',
                                                                                                          hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
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
                                                                                                                  controller: dateController,
                                                                                                                  inputFormatters: [InputMask.maskDate],
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                    hintText: '08/24',
                                                                                                                    hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
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
                                                                                                                  controller: phoneUzController,
                                                                                                                  inputFormatters: [InputMask.maskPhoneNumber],
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                    hintText: '998',
                                                                                                                    hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
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
                                                                                              onPressed: () async {
                                                                                                setState(() {
                                                                                                  cardNumber = 1;
                                                                                                });
                                                                                                print('index is: $cardNumber');
                                                                                                if (_formKey.currentState.validate()) {
                                                                                                  await AddPlasticCardType.addPlasticCardType(
                                                                                                    typeId: 14,
                                                                                                    cardNumber: uzCardController.text,
                                                                                                    cardPhoneNumber: phoneUzController.text,
                                                                                                    cardExpire: dateController.text,
                                                                                                  );

                                                                                                  // g.Get.back();
                                                                                                } else {
                                                                                                  print('no');
                                                                                                }
                                                                                                // Scaffold.of(context).hideCurrentSnackBar();
                                                                                                // validateAndSave();
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
                                                                              ),
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

                                                                      g.Get
                                                                          .back();
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
                                                                            return Form(
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
                                                                                                        controller: humoController,
                                                                                                        inputFormatters: [InputMask.maskHumo],
                                                                                                        keyboardType: TextInputType.number,
                                                                                                        decoration: InputDecoration(
                                                                                                          contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                          hintText: '9860',
                                                                                                          hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
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
                                                                                                                  controller: dateHumoController,
                                                                                                                  inputFormatters: [InputMask.maskDate],
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
                                                                                                                    hintText: '08/24',
                                                                                                                    hintStyle: FontStyles.regularStyle(fontSize: 16, fontFamily: 'Ubuntu', color: Color(0xff9E9E9E)),
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
                                                                                                                  controller: phoneHumoController,
                                                                                                                  inputFormatters: [InputMask.maskPhoneNumber],
                                                                                                                  keyboardType: TextInputType.number,
                                                                                                                  decoration: InputDecoration(
                                                                                                                    contentPadding: const EdgeInsets.only(left: 8.0, bottom: 2, top: 2),
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
                                                                                              onPressed: () async {
                                                                                                setState(() {
                                                                                                  cardNumber = 2;
                                                                                                });
                                                                                                print('index is: $cardNumber');

                                                                                                // Scaffold.of(context).hideCurrentSnackBar();
                                                                                                // validateAndSave();
                                                                                                if (_formKey.currentState.validate()) {
                                                                                                  await AddPlasticCardType.addPlasticCardType(
                                                                                                    typeId: 15,
                                                                                                    cardNumber: humoController.text,
                                                                                                    cardPhoneNumber: phoneHumoController.text,
                                                                                                    cardExpire: dateHumoController.text,
                                                                                                  );
                                                                                                  // g.Get.back();
                                                                                                } else {
                                                                                                  print('no');
                                                                                                }
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
                                                                              ),
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
                                  );
                                } else {
                                  return Container(
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
                                              child: plasticCardTypeController
                                                      .plasticCardTypeList
                                                      .isNotEmpty
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
                                                plasticCardTypeController
                                                        .plasticCardTypeList
                                                        .isNotEmpty
                                                    ? uzCardController.text
                                                        .toString()
                                                        .substring(0, 4)
                                                    : humoController.text
                                                        .toString()
                                                        .substring(0, 4),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                plasticCardTypeController
                                                        .plasticCardTypeList
                                                        .isNotEmpty
                                                    ? uzCardController.text
                                                        .toString()
                                                        .substring(4, 8)
                                                    : humoController.text
                                                        .toString()
                                                        .substring(4, 8),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                plasticCardTypeController
                                                        .plasticCardTypeList
                                                        .isNotEmpty
                                                    ? uzCardController.text
                                                        .toString()
                                                        .substring(8, 12)
                                                    : humoController.text
                                                        .toString()
                                                        .substring(8, 12),
                                                style: FontStyles.boldStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              ),
                                              Text(
                                                plasticCardTypeController
                                                        .plasticCardTypeList
                                                        .isNotEmpty
                                                    ? uzCardController.text
                                                        .toString()
                                                        .substring(12, 19)
                                                    : humoController.text
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
                                                    plasticCardTypeController
                                                            .plasticCardTypeList
                                                            .isNotEmpty
                                                        ? dateController.text
                                                            .toString()
                                                        : dateHumoController
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
                                                    plasticCardTypeController
                                                            .plasticCardTypeList
                                                            .isNotEmpty
                                                        ? phoneUzController.text
                                                            .toString()
                                                        : phoneHumoController
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
                                                nameController.text.toString(),
                                                style: FontStyles.regularStyle(
                                                  fontSize: 13,
                                                  fontFamily: 'Montserrat',
                                                  color: Color(0xff646974),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                    final token = MyPref.secondToken;
                    var response = await dio.post(
                      ApiUrl.updateProfile,
                      data: formData,
                      options: Options(
                        headers: {
                          HttpHeaders.authorizationHeader: 'Bearer $token'
                        },
                      ),
                      // body: {
                      //   'name': nameController.text,
                      //   'phone': phoneController.text,
                      // },
                    );
                    if (response.statusCode == 200) {
                      print('okayy');
                      // _scaffoldKey.currentState.showSnackBar(
                      //   SnackBar(
                      //     behavior: SnackBarBehavior.floating,
                      //     action: SnackBarAction()
                      //     backgroundColor: Color(0xff007E33),
                      //     content: Text('asdas'),
                      //   ),
                      // );
                      g.Get.snackbar(null, null,
                          messageText: Text(
                            'Ваши данные сохранены!',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Color(0xff007E33));
                      usrController.fetchProfileData();
                    }
                  },
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

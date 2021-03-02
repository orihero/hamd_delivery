import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyCustomModelBottomSheet extends StatefulWidget {
  @override
  _MyCustomModelBottomSheetState createState() =>
      _MyCustomModelBottomSheetState();
}

class _MyCustomModelBottomSheetState extends State<MyCustomModelBottomSheet> {
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
  @override
  Widget build(BuildContext context) {
    return IconButton(
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
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          context: context,
          builder: (context) {
            return StatefulBuilder(
              builder: (context, StateSetter state) {
                return Container(
                  padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ' Добавить новую карту',
                        style: FontStyles.mediumStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          color: Color(0xff0E0E0E),
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            child: SvgPicture.asset(
                              'assets/icons/uzcard.svg',
                              width: 40,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: Color(0xffFFBC41),
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: 1,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                print('Radio $val');
                                if (selectedCard == 2) {
                                  setState(() {
                                    selectedCard = 1;
                                    ssCard = val;
                                    print('your ssCard : $ssCard');
                                  });
                                  print('your selecte Card: $selectedCard');
                                }
                                state(() {
                                  print(
                                      'your selected radio is: $selectedRadio');
                                  ssCard = val;
                                  print('your ssCard : $ssCard');
                                  selectedRadioValue(val);
                                });

                                ////////////////////////////////////
                                ////////////////////////////////////
                                /////////Second Modal BottomShit/////
                                /////////////////////////////////////
                                //////////////////////////////////
                                //////////////////////////////////////

                                Get.back();
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: StatefulBuilder(builder:
                                            (context, StateSetter state) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Card(
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 18,
                                                                vertical: 17),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Номер карты',
                                                              style: FontStyles
                                                                  .regularStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xff646974),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 5),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: const Color(
                                                                          0xffFFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1,
                                                                        color: Color(
                                                                            0xffE1E1E1),
                                                                      )),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    uzCardNumberConteoller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0,
                                                                          bottom:
                                                                              2,
                                                                          top:
                                                                              2),
                                                                  // hintText: '0000 0000 0000 0000',
                                                                  hintStyle: FontStyles.regularStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Ubuntu',
                                                                      color: Color(
                                                                          0xff9E9E9E)),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                                onSaved: (input) =>
                                                                    nameValue =
                                                                        input,
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'год/месяц',
                                                                        style: FontStyles
                                                                            .regularStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xff646974),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 10.0),
                                                                        decoration: BoxDecoration(
                                                                            color: const Color(0xffFFFFFF),
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            border: Border.all(
                                                                              width: 1,
                                                                              color: Color(0xffE1E1E1),
                                                                            )),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              expireController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding: const EdgeInsets.only(
                                                                                left: 8.0,
                                                                                bottom: 2,
                                                                                top: 2),
                                                                            // hintText:
                                                                            //     '08/24',
                                                                            hintStyle: FontStyles.regularStyle(
                                                                                fontSize: 16,
                                                                                fontFamily: 'Ubuntu',
                                                                                color: Color(0xff9E9E9E)),
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          onSaved: (input) =>
                                                                              expireDate = input,
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'номер телефона',
                                                                        style: FontStyles
                                                                            .regularStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xff646974),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 0.0),
                                                                        decoration: BoxDecoration(
                                                                            color: const Color(0xffFFFFFF),
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            border: Border.all(
                                                                              width: 1,
                                                                              color: Color(0xffE1E1E1),
                                                                            )),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              phoneNumberController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding: const EdgeInsets.only(
                                                                                left: 8.0,
                                                                                bottom: 2,
                                                                                top: 2),
                                                                            // hintText:
                                                                            //     hintText,
                                                                            hintStyle: FontStyles.regularStyle(
                                                                                fontSize: 16,
                                                                                fontFamily: 'Ubuntu',
                                                                                color: Color(0xff9E9E9E)),
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          onSaved: (input) =>
                                                                              phoneNumber = input,
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
                                                      color: ColorPalatte
                                                          .strongRedColor,
                                                      onPressed: () {
                                                        setState(() {
                                                          ++cardNumber;
                                                        });
                                                        print(
                                                            'index is: $cardNumber');

                                                        // Scaffold.of(context).hideCurrentSnackBar();
                                                        Get.back();
                                                      },
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                      child: Text(
                                                        'ДОБАВИТЬ',
                                                        style: FontStyles
                                                            .boldStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                color: Colors
                                                                    .white),
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
                      Row(
                        children: [
                          Container(
                            child: Image.asset(
                              'assets/images/humo.png',
                              width: 40,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              activeColor: Color(0xffFFBC41),
                              controlAffinity: ListTileControlAffinity.trailing,
                              value: 2,
                              groupValue: selectedRadio,
                              onChanged: (val) {
                                if (selectedCard == 1) {
                                  setState(() {
                                    selectedCard = 2;
                                    ssCard = val;
                                    print('your ssCard : $ssCard');
                                  });
                                  print('your selecte Card: $selectedCard');
                                }
                                state(() {
                                  print(
                                      'your selected radio is: $selectedRadio');
                                  selectedRadioValue(val);
                                  ssCard = val;
                                  print('your ssCard : $ssCard');
                                });
                                print('Radio $val');
                                selectedRadioValue(val);

                                //////////////////////////////////////////
                                /////////////////////////////////////////
                                /////////////THird ModalShitt//////////////
                                //////////////////////////////////////////

                                Get.back();
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) {
                                      return Padding(
                                        padding:
                                            MediaQuery.of(context).viewInsets,
                                        child: StatefulBuilder(builder:
                                            (context, StateSetter state) {
                                          return Container(
                                            padding: EdgeInsets.only(
                                                top: 10, left: 20, right: 20),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Text(
                                                    'Добавление карты',
                                                    style:
                                                        FontStyles.regularStyle(
                                                      fontSize: 17,
                                                      fontFamily: 'Montserrat',
                                                      color: Color(0xff232323),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 15,
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Card(
                                                      color: Colors.white,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(15),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 18,
                                                                vertical: 17),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Номер карты',
                                                              style: FontStyles
                                                                  .regularStyle(
                                                                fontSize: 13,
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xff646974),
                                                              ),
                                                            ),
                                                            Container(
                                                              margin: EdgeInsets
                                                                  .only(top: 5),
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      0.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: const Color(
                                                                          0xffFFFFFF),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        width:
                                                                            1,
                                                                        color: Color(
                                                                            0xffE1E1E1),
                                                                      )),
                                                              child:
                                                                  TextFormField(
                                                                controller:
                                                                    humoCardNumberConteoller,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                decoration:
                                                                    InputDecoration(
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0,
                                                                          bottom:
                                                                              2,
                                                                          top:
                                                                              2),
                                                                  // hintText: '0000 0000 0000 0000',
                                                                  hintStyle: FontStyles.regularStyle(
                                                                      fontSize:
                                                                          16,
                                                                      fontFamily:
                                                                          'Ubuntu',
                                                                      color: Color(
                                                                          0xff9E9E9E)),
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize:
                                                                      16.0,
                                                                ),
                                                                onSaved: (input) =>
                                                                    nameValue =
                                                                        input,
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'год/месяц',
                                                                        style: FontStyles
                                                                            .regularStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xff646974),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 10.0),
                                                                        decoration: BoxDecoration(
                                                                            color: const Color(0xffFFFFFF),
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            border: Border.all(
                                                                              width: 1,
                                                                              color: Color(0xffE1E1E1),
                                                                            )),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              expireController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding: const EdgeInsets.only(
                                                                                left: 8.0,
                                                                                bottom: 2,
                                                                                top: 2),
                                                                            // hintText:
                                                                            //     '08/24',
                                                                            hintStyle: FontStyles.regularStyle(
                                                                                fontSize: 16,
                                                                                fontFamily: 'Ubuntu',
                                                                                color: Color(0xff9E9E9E)),
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          onSaved: (input) =>
                                                                              expireDate = input,
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
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'номер телефона',
                                                                        style: FontStyles
                                                                            .regularStyle(
                                                                          fontSize:
                                                                              13,
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xff646974),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        margin: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 0.0),
                                                                        decoration: BoxDecoration(
                                                                            color: const Color(0xffFFFFFF),
                                                                            borderRadius: BorderRadius.circular(15),
                                                                            border: Border.all(
                                                                              width: 1,
                                                                              color: Color(0xffE1E1E1),
                                                                            )),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              phoneNumberController,
                                                                          keyboardType:
                                                                              TextInputType.number,
                                                                          decoration:
                                                                              InputDecoration(
                                                                            contentPadding: const EdgeInsets.only(
                                                                                left: 8.0,
                                                                                bottom: 2,
                                                                                top: 2),
                                                                            // hintText:
                                                                            //     hintText,
                                                                            hintStyle: FontStyles.regularStyle(
                                                                                fontSize: 16,
                                                                                fontFamily: 'Ubuntu',
                                                                                color: Color(0xff9E9E9E)),
                                                                            border:
                                                                                InputBorder.none,
                                                                          ),
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                16.0,
                                                                          ),
                                                                          onSaved: (input) =>
                                                                              phoneNumber = input,
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
                                                      color: ColorPalatte
                                                          .strongRedColor,
                                                      onPressed: () {
                                                        setState(() {
                                                          ++cardNumber;
                                                        });
                                                        print(
                                                            'index is: $cardNumber');

                                                        // Scaffold.of(context).hideCurrentSnackBar();
                                                        Get.back();
                                                      },
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15)),
                                                      child: Text(
                                                        'ДОБАВИТЬ',
                                                        style: FontStyles
                                                            .boldStyle(
                                                                fontSize: 16,
                                                                fontFamily:
                                                                    'Ubuntu',
                                                                color: Colors
                                                                    .white),
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
                    ],
                  ),
                );
              },
            );
          },
        );

        // Scaffold.of(context).showSnackBar(
        //   SnackBar(
        //     duration: Duration(minutes: 2),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.all(
        //         Radius.circular(15),
        //       ),
        //     ),
        //     backgroundColor: Colors.white,
        //     padding: EdgeInsets.symmetric(
        //         horizontal: 16, vertical: 20),
        //     content: Column(
        //       crossAxisAlignment:
        //           CrossAxisAlignment.start,
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         Text(
        //           'Добавление карты',
        //           style:
        //               FontStyles.regularStyle(
        //             fontSize: 17,
        //             fontFamily: 'Montserrat',
        //             color: Color(0xff232323),
        //           ),
        //         ),
        //         Container(
        //           width: MediaQuery.of(context)
        //               .size
        //               .width,
        //           child: Card(
        //             color: Colors.white,
        //             shape:
        //                 RoundedRectangleBorder(
        //               borderRadius:
        //                   BorderRadius.all(
        //                 Radius.circular(15),
        //               ),
        //             ),
        //             child: Padding(
        //               padding:
        //                   EdgeInsets.symmetric(
        //                       horizontal: 18,
        //                       vertical: 17),
        //               child: Column(
        //                 crossAxisAlignment:
        //                     CrossAxisAlignment
        //                         .start,
        //                 children: [
        //                   Text(
        //                     'Номер карты',
        //                     style: FontStyles
        //                         .regularStyle(
        //                       fontSize: 13,
        //                       fontFamily:
        //                           'Montserrat',
        //                       color: Color(
        //                           0xff646974),
        //                     ),
        //                   ),
        //                   Container(
        //                     margin:
        //                         EdgeInsets.only(
        //                             top: 5),
        //                     padding:
        //                         const EdgeInsets
        //                                 .symmetric(
        //                             horizontal:
        //                                 0.0),
        //                     decoration:
        //                         BoxDecoration(
        //                             color: const Color(
        //                                 0xffFFFFFF),
        //                             borderRadius:
        //                                 BorderRadius.circular(
        //                                     15),
        //                             border:
        //                                 Border
        //                                     .all(
        //                               width: 1,
        //                               color: Color(
        //                                   0xffE1E1E1),
        //                             )),
        //                     child:
        //                         TextFormField(
        //                       controller:
        //                           cardNumberConteoller,
        //                       keyboardType:
        //                           TextInputType
        //                               .number,
        //                       decoration:
        //                           InputDecoration(
        //                         contentPadding:
        //                             const EdgeInsets
        //                                     .only(
        //                                 left:
        //                                     8.0,
        //                                 bottom:
        //                                     2,
        //                                 top: 2),
        //                         hintText:
        //                             '0000 0000 0000 0000',
        //                         hintStyle: FontStyles.regularStyle(
        //                             fontSize:
        //                                 16,
        //                             fontFamily:
        //                                 'Ubuntu',
        //                             color: Color(
        //                                 0xff9E9E9E)),
        //                         border:
        //                             InputBorder
        //                                 .none,
        //                       ),
        //                       style: TextStyle(
        //                         color: Colors
        //                             .black,
        //                         fontSize: 16.0,
        //                       ),
        //                       onSaved: (input) =>
        //                           nameValue =
        //                               input,
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 8,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Expanded(
        //                         flex: 3,
        //                         child: Column(
        //                           mainAxisSize:
        //                               MainAxisSize
        //                                   .min,
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment
        //                                   .start,
        //                           children: [
        //                             Text(
        //                               'год/месяц',
        //                               style: FontStyles
        //                                   .regularStyle(
        //                                 fontSize:
        //                                     13,
        //                                 fontFamily:
        //                                     'Montserrat',
        //                                 color: Color(
        //                                     0xff646974),
        //                               ),
        //                             ),
        //                             Container(
        //                               margin: EdgeInsets
        //                                   .only(
        //                                       top: 5),
        //                               padding: const EdgeInsets
        //                                       .symmetric(
        //                                   horizontal:
        //                                       10.0),
        //                               decoration: BoxDecoration(
        //                                   color: const Color(0xffFFFFFF),
        //                                   borderRadius: BorderRadius.circular(15),
        //                                   border: Border.all(
        //                                     width:
        //                                         1,
        //                                     color:
        //                                         Color(0xffE1E1E1),
        //                                   )),
        //                               child:
        //                                   TextFormField(
        //                                 controller:
        //                                     expireController,
        //                                 keyboardType:
        //                                     TextInputType.number,
        //                                 decoration:
        //                                     InputDecoration(
        //                                   contentPadding: const EdgeInsets.only(
        //                                       left: 8.0,
        //                                       bottom: 2,
        //                                       top: 2),
        //                                   // hintText:
        //                                   //     '08/24',
        //                                   hintStyle: FontStyles.regularStyle(
        //                                       fontSize: 16,
        //                                       fontFamily: 'Ubuntu',
        //                                       color: Color(0xff9E9E9E)),
        //                                   border:
        //                                       InputBorder.none,
        //                                 ),
        //                                 style:
        //                                     TextStyle(
        //                                   color:
        //                                       Colors.black,
        //                                   fontSize:
        //                                       16.0,
        //                                 ),
        //                                 onSaved:
        //                                     (input) =>
        //                                         expireDate = input,
        //                               ),
        //                             )
        //                           ],
        //                         ),
        //                       ),
        //                       SizedBox(
        //                         width: 16,
        //                       ),
        //                       Expanded(
        //                         flex: 8,
        //                         child: Column(
        //                           mainAxisSize:
        //                               MainAxisSize
        //                                   .min,
        //                           crossAxisAlignment:
        //                               CrossAxisAlignment
        //                                   .start,
        //                           children: [
        //                             Text(
        //                               'номер телефона',
        //                               style: FontStyles
        //                                   .regularStyle(
        //                                 fontSize:
        //                                     13,
        //                                 fontFamily:
        //                                     'Montserrat',
        //                                 color: Color(
        //                                     0xff646974),
        //                               ),
        //                             ),
        //                             Container(
        //                               margin: EdgeInsets
        //                                   .only(
        //                                       top: 5),
        //                               padding: const EdgeInsets
        //                                       .symmetric(
        //                                   horizontal:
        //                                       0.0),
        //                               decoration: BoxDecoration(
        //                                   color: const Color(0xffFFFFFF),
        //                                   borderRadius: BorderRadius.circular(15),
        //                                   border: Border.all(
        //                                     width:
        //                                         1,
        //                                     color:
        //                                         Color(0xffE1E1E1),
        //                                   )),
        //                               child:
        //                                   TextFormField(
        //                                 controller:
        //                                     phoneNumberController,
        //                                 keyboardType:
        //                                     TextInputType.number,
        //                                 decoration:
        //                                     InputDecoration(
        //                                   contentPadding: const EdgeInsets.only(
        //                                       left: 8.0,
        //                                       bottom: 2,
        //                                       top: 2),
        //                                   // hintText:
        //                                   //     hintText,
        //                                   hintStyle: FontStyles.regularStyle(
        //                                       fontSize: 16,
        //                                       fontFamily: 'Ubuntu',
        //                                       color: Color(0xff9E9E9E)),
        //                                   border:
        //                                       InputBorder.none,
        //                                 ),
        //                                 style:
        //                                     TextStyle(
        //                                   color:
        //                                       Colors.black,
        //                                   fontSize:
        //                                       16.0,
        //                                 ),
        //                                 onSaved:
        //                                     (input) =>
        //                                         phoneNumber = input,
        //                               ),
        //                             ),
        //                           ],
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   SizedBox(
        //                     height: 8,
        //                   ),
        //                   // Row(
        //                   //   children: [
        //                   //     Expanded(
        //                   //         flex: 6,
        //                   //         child:
        //                   //             Container(
        //                   //           margin: EdgeInsets
        //                   //               .only(
        //                   //                   top: 5),
        //                   //           padding: const EdgeInsets
        //                   //                   .symmetric(
        //                   //               horizontal:
        //                   //                   0.0),
        //                   //           decoration: BoxDecoration(
        //                   //               color: const Color(0xffFFFFFF),
        //                   //               borderRadius: BorderRadius.circular(15),
        //                   //               border: Border.all(
        //                   //                 width:
        //                   //                     1,
        //                   //                 color:
        //                   //                     Color(0xff646974),
        //                   //               )),
        //                   //           child:
        //                   //               TextFormField(
        //                   //             controller:
        //                   //                 nameController,
        //                   //             keyboardType:
        //                   //                 TextInputType.text,
        //                   //             decoration:
        //                   //                 InputDecoration(
        //                   //               contentPadding: const EdgeInsets.only(
        //                   //                   left: 8.0,
        //                   //                   bottom: 2,
        //                   //                   top: 2),
        //                   //               hintText:
        //                   //                   'Прокопенко Вячеслав',
        //                   //               hintStyle: FontStyles.regularStyle(
        //                   //                   fontSize: 16,
        //                   //                   fontFamily: 'Ubuntu',
        //                   //                   color: Color(0xff9E9E9E)),
        //                   //               border:
        //                   //                   InputBorder.none,
        //                   //             ),
        //                   //             style:
        //                   //                 TextStyle(
        //                   //               color:
        //                   //                   Colors.black,
        //                   //               fontSize:
        //                   //                   16.0,
        //                   //             ),
        //                   //             onSaved:
        //                   //                 (input) =>
        //                   //                     nameValue = input,
        //                   //           ),
        //                   //         )),
        //                   //     SizedBox(
        //                   //       width: 10,
        //                   //     ),
        //                   //     Expanded(
        //                   //         flex: 1,
        //                   //         child: SvgPicture
        //                   //             .asset(
        //                   //                 'assets/icons/sim.svg')),
        //                   //   ],
        //                   // ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 15,
        //         ),
        //         Container(
        //           height: 54,
        //           width: double.infinity,
        //           child: RaisedButton(
        //             elevation: 0,
        //             color: ColorPalatte
        //                 .strongRedColor,
        //             onPressed: () {
        //               setState(() {
        //                 ++cardNumber;
        //               });
        //               print(
        //                   'index is: $cardNumber');

        //               Scaffold.of(context)
        //                   .hideCurrentSnackBar();
        //             },
        //             shape:
        //                 RoundedRectangleBorder(
        //                     borderRadius:
        //                         BorderRadius
        //                             .circular(
        //                                 15)),
        //             child: Text(
        //               'ДОБАВИТЬ',
        //               style:
        //                   FontStyles.boldStyle(
        //                       fontSize: 16,
        //                       fontFamily:
        //                           'Ubuntu',
        //                       color:
        //                           Colors.white),
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // );
      },
    );
  }
}

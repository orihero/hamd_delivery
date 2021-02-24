import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/my_platic_card/widgets/custom_textFromField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyPlasticCard extends StatefulWidget {
  @override
  _MyPlasticCardState createState() => _MyPlasticCardState();
}

class _MyPlasticCardState extends State<MyPlasticCard> {
  int cardNumber = 0;
  String nameValue;
  MaskedTextController cardNumberConteoller =
      MaskedTextController(mask: '0000 0000 0000 0000');
  MaskedTextController expireController = MaskedTextController(mask: '00/00');
  MaskedTextController phoneNumberController =
      MaskedTextController(mask: '000 00 000 00 00', text: '998');

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalatte.mainPageColor,
        appBar: PreferredSize(
          child: customAppBar(
            context,
            title: 'Мои карты',
            onpress1: () => Get.back(),
          ),
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top),
        ),
        body: Builder(
          builder: (context) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
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
                  Positioned(
                    child: Center(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width * .7,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
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
                                      Icons.add,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context).showSnackBar(
                                        SnackBar(
                                          duration: Duration(minutes: 2),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          backgroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16, vertical: 20),
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
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
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
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
                                                        CustomTextFromFiled(
                                                          textInputType:
                                                              TextInputType
                                                                  .number,
                                                          hintText:
                                                              '0000_0000_0000_000',
                                                          myController:
                                                              cardNumberConteoller,
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
                                                                      color: Color(
                                                                          0xff646974),
                                                                    ),
                                                                  ),
                                                                  CustomTextFromFiled(
                                                                    textInputType:
                                                                        TextInputType
                                                                            .number,
                                                                    hintText:
                                                                        '08/24',
                                                                    myController:
                                                                        expireController,
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
                                                                      color: Color(
                                                                          0xff646974),
                                                                    ),
                                                                  ),
                                                                  CustomTextFromFiled(
                                                                    textInputType:
                                                                        TextInputType
                                                                            .number,
                                                                    hintText:
                                                                        '+998 90 755 4554',
                                                                    myController:
                                                                        phoneNumberController,
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                flex: 6,
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          top:
                                                                              5),
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          0.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: const Color(
                                                                              0xffFFFFFF),
                                                                          borderRadius: BorderRadius.circular(
                                                                              15),
                                                                          border:
                                                                              Border.all(
                                                                            width:
                                                                                1,
                                                                            color:
                                                                                Color(0xff646974),
                                                                          )),
                                                                  child:
                                                                      TextFormField(
                                                                    controller:
                                                                        nameController,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              8.0,
                                                                          bottom:
                                                                              2,
                                                                          top:
                                                                              2),
                                                                      hintText:
                                                                          'Прокопенко Вячеслав',
                                                                      hintStyle: FontStyles.regularStyle(
                                                                          fontSize:
                                                                              16,
                                                                          fontFamily:
                                                                              'Ubuntu',
                                                                          color:
                                                                              Color(0xff9E9E9E)),
                                                                      border: InputBorder
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
                                                                )),
                                                            SizedBox(
                                                              width: 10,
                                                            ),
                                                            Expanded(
                                                                flex: 1,
                                                                child: SvgPicture
                                                                    .asset(
                                                                        'assets/icons/sim.svg')),
                                                          ],
                                                        )
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
                                                  onPressed: () => Get.back(),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

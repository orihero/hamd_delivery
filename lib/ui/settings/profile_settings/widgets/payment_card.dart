import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:HAMD_Delivery/controllers/platic_card_humo_controller.dart';
import 'package:HAMD_Delivery/services/add_plastic_card.dart';
import 'package:HAMD_Delivery/services/edit_plastic_card.dart';
import 'package:HAMD_Delivery/ui/masks/masks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:HAMD_Delivery/services/delete_plastic_card.dart';

class PaymentCard extends StatefulWidget {
  PaymentCard({
    Key key,
    @required this.plasticCardUzcardController,
    @required this.uzCardController,
    @required this.humoCardController,
    @required this.dateUzCardController,
    @required this.dateHumoController,
    @required this.phoneUzCardController,
    @required this.phoneHumoController,
    @required this.nameController,
    @required this.isUzCard,
    @required this.plasticId,
    @required this.editFunction,
  }) : super(key: key);

  final PlasticCardTypeController plasticCardUzcardController;
  final TextEditingController uzCardController;
  final TextEditingController humoCardController;
  final TextEditingController dateUzCardController;
  final TextEditingController dateHumoController;
  final TextEditingController phoneUzCardController;
  final TextEditingController phoneHumoController;
  final TextEditingController nameController;
  final Function editFunction;
  final bool isUzCard;
  final int plasticId;

  @override
  _PaymentCardState createState() => _PaymentCardState();
}

class _PaymentCardState extends State<PaymentCard> {
  final _formKey = GlobalKey<FormState>();
  final PlasticCardHumoController plasticCardHumoController =
      Get.find<PlasticCardHumoController>();

  final TextEditingController newUzCardController = TextEditingController();
  final TextEditingController newHumoCardController = TextEditingController();

  final TextEditingController newUzPhoneController = TextEditingController();
  final TextEditingController newHumoPhoneController = TextEditingController();

  final TextEditingController newUzDateController = TextEditingController();
  final TextEditingController newHumoDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 11, bottom: 11),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.isUzCard
                        ? SvgPicture.asset(
                            'assets/icons/uzcard.svg',
                            height: 30,
                          )
                        : Image.asset(
                            'assets/images/humo.png',
                            height: 30,
                          ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.edit,
                            color: ColorPalatte.strongRedColor,
                          ),
                          onPressed: () => buildCardChange(context),
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: ColorPalatte.strongRedColor,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                    'Вы действительно хотите удалить карту?',
                                    style: TextStyle(
                                      fontSize: 17.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  actions: [
                                    FlatButton(
                                      onPressed: () => Get.back(),
                                      child: Text(
                                        'нет'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: ColorPalatte.strongRedColor,
                                        ),
                                      ),
                                    ),
                                    FlatButton(
                                      child: Text(
                                        'да'.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: ColorPalatte.strongRedColor,
                                        ),
                                      ),
                                      onPressed: () async {
                                        Get.back();
                                        await DeletePlasticCard
                                            .deletePlasticCard(
                                                cardId: widget.plasticId,
                                                isUzCard: widget.isUzCard);
                                        widget.isUzCard
                                            ? widget.uzCardController.clear()
                                            : widget.humoCardController.clear();
                                        widget.isUzCard
                                            ? widget.dateUzCardController
                                                .clear()
                                            : widget.dateHumoController.clear();
                                        widget.isUzCard
                                            ? widget.phoneUzCardController
                                                .clear()
                                            : widget.phoneHumoController
                                                .clear();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.isUzCard
                        ? widget.uzCardController.text
                            .toString()
                            .substring(0, 4)
                        : widget.humoCardController.text
                            .toString()
                            .substring(0, 4),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    widget.isUzCard
                        ? widget.uzCardController.text
                            .toString()
                            .substring(4, 8)
                        : widget.humoCardController.text
                            .toString()
                            .substring(4, 8),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    widget.isUzCard
                        ? widget.uzCardController.text
                            .toString()
                            .substring(8, 12)
                        : widget.humoCardController.text
                            .toString()
                            .substring(8, 12),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    widget.isUzCard
                        ? widget.uzCardController.text
                            .toString()
                            .substring(12, 19)
                        : widget.humoCardController.text
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'год/месяц',
                        style: FontStyles.regularStyle(
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      Text(
                        widget.isUzCard
                            ? widget.dateUzCardController.text.toString()
                            : widget.dateHumoController.text.toString(),
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
                        style: FontStyles.regularStyle(
                          fontSize: 13,
                          fontFamily: 'Montserrat',
                          color: Color(0xff646974),
                        ),
                      ),
                      Text(
                        widget.isUzCard
                            ? widget.phoneUzCardController.text.toString()
                            : widget.phoneHumoController.text.toString(),
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
                  padding: EdgeInsets.only(bottom: 15),
                  child: Text(
                    widget.nameController.text.toString(),
                    style: FontStyles.regularStyle(
                      fontSize: 13,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  buildCardChange(BuildContext context) {
    Get.bottomSheet(
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
                                    ),
                                  ),
                                  child: TextFormField(
                                    controller: widget.isUzCard
                                        ? newUzCardController
                                        : newHumoCardController,
                                    inputFormatters: [
                                      widget.isUzCard
                                          ? InputMask.maskUzCard
                                          : InputMask.maskHumo
                                    ],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.only(
                                          left: 8.0, bottom: 2, top: 2),
                                      hintText:
                                          widget.isUzCard ? '8600' : '9860',
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
                                              controller: widget.isUzCard
                                                  ? newUzDateController
                                                  : newHumoDateController,
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
                                              controller: widget.isUzCard
                                                  ? newUzPhoneController
                                                  : newHumoPhoneController,
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
                              await EditPlasticCard.editPlasticCard(
                                id: widget.plasticId,
                                isUzCard: widget.isUzCard,
                                cardNumber: widget.isUzCard
                                    ? newUzCardController.text
                                    : newHumoCardController.text,
                                cardPhoneNumber: widget.isUzCard
                                    ? newUzPhoneController.text
                                    : newHumoPhoneController.text,
                                cardExpire: widget.isUzCard
                                    ? newUzDateController.text
                                    : newHumoDateController.text,
                              );
                              // await widget.plasticCardUzcardController
                              //     .fetchPlasticCardType(14);
                              // await plasticCardHumoController
                              //     .fetchPlasticCardHumo(15);
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

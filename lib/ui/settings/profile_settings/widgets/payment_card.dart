import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/plastic_card_type_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
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
  }) : super(key: key);

  final PlasticCardTypeController plasticCardUzcardController;
  final TextEditingController uzCardController;
  final TextEditingController humoCardController;
  final TextEditingController dateUzCardController;
  final TextEditingController dateHumoController;
  final TextEditingController phoneUzCardController;
  final TextEditingController phoneHumoController;
  final TextEditingController nameController;
  final bool isUzCard;

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
                child: isUzCard
                    ? SvgPicture.asset(
                        'assets/icons/uzcard.svg',
                        height: 30,
                      )
                    : Image.asset(
                        'assets/images/humo.png',
                        height: 30,
                      ),
              ),
              Row(
                children: [
                  Text(
                    isUzCard
                        ? uzCardController.text.toString().substring(0, 4)
                        : humoCardController.text.toString().substring(0, 4),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    isUzCard
                        ? uzCardController.text.toString().substring(4, 8)
                        : humoCardController.text.toString().substring(4, 8),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    isUzCard
                        ? uzCardController.text.toString().substring(8, 12)
                        : humoCardController.text.toString().substring(8, 12),
                    style: FontStyles.boldStyle(
                      fontSize: 18,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    isUzCard
                        ? uzCardController.text.toString().substring(12, 19)
                        : humoCardController.text.toString().substring(12, 19),
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
                        isUzCard
                            ? dateUzCardController.text.toString()
                            : dateHumoController.text.toString(),
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
                        isUzCard
                            ? phoneUzCardController.text.toString()
                            : phoneHumoController.text.toString(),
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
      ),
    );
  }
}

import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/location_in_map.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AccptedOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        height: 15,
      ),
      itemCount: 7,
      itemBuilder: (context, index) => Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Id 4562455865',
                    style: FontStyles.regularStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  Text(
                    '12.03.2020',
                    style: FontStyles.regularStyle(
                      fontSize: 14,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .1,
                      color: Colors.white,
                      child: Column(
                        children: [
                          SvgPicture.asset(
                            'assets/icons/location.svg',
                            height: 35,
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffB6C5EE),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffB6C5EE),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xffB6C5EE),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff9F111B),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 9,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .9,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Заказ из',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xffAAAEB7),
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            'HAMD центральный филиал',
                            style: FontStyles.boldStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Едем в',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xffAAAEB7),
                            ),
                          ),
                          Text(
                            'Ул. Нукусская, 92, кв.21',
                            style: FontStyles.boldStyle(
                              fontSize: 15,
                              fontFamily: 'Montserrat',
                              color: Color(0xff232323),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    'Цена:',
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: Color(0xff646974),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '12 500 сум (2500 сум)',
                    style: FontStyles.regularStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Image.asset('assets/images/cards.png'),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Оплата: Наличными',
                    style: FontStyles.boldStyle(
                      fontSize: 15,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Divider(
                thickness: 1,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyIcons(
                    icon: IconButton(
                      icon: Icon(
                        Icons.map,
                        color: Colors.black,
                      ),
                      onPressed: () => Get.to(MyApp()),
                    ),
                  ),
                  MyIcons(
                    icon: IconButton(
                      icon: Icon(
                        Icons.phone,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.86,
              //   height: 50,
              //   child: RaisedButton(
              //     elevation: 0,
              //     color: Color(0xff9F111B),
              //     onPressed: () {},
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //     child: Text(
              //       'Пожаловаться на клиента',
              //       style: FontStyles.mediumStyle(
              //         fontSize: 16,
              //         fontFamily: 'Montserrat',
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

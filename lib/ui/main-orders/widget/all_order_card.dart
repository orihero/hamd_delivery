import 'dart:async';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/controllers/screen_controller.dart';
import 'package:HAMD_Delivery/models/all_orders_model.dart';
import 'package:HAMD_Delivery/provider/all_order_provider.dart';
import 'package:HAMD_Delivery/services/accept_order.dart';
import 'package:HAMD_Delivery/services/repository.dart';
import 'package:HAMD_Delivery/utils/my_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class AllOrderCard extends StatefulWidget {
  @override
  _AllOrderCardState createState() => _AllOrderCardState();
}

class _AllOrderCardState extends State<AllOrderCard> {
  var length;
  final AllOrdersController allOrdersController =
      Get.find<AllOrdersController>();
  final ScreenController screenController = Get.find<ScreenController>();
  Repository repository = Repository();
  Timer _timer;
  int _start = 3;
  bool loading = true;
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            loading = false;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<AllOrderPrivder>(
        builder: (_, allOrderProivder, __) {
          if (allOrderProivder.allOrderModel.data.isEmpty && loading == true) {
            return allOrderProivder.allOrderModel.data.isEmpty
                ? Center(
                    child: loading == true
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              ColorPalatte.strongRedColor,
                            ),
                          )
                        : Text(
                            'there is no data',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                  )
                : Text(
                    'there is no order',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  );
          }
          return RefreshIndicator(
            color: ColorPalatte.strongRedColor,
            onRefresh: () => repository.fetchOrders(context),
            child: ListView.separated(
                itemCount: allOrderProivder.allOrderModel.data.length,
                separatorBuilder: (context, index) => SizedBox(
                      height: 15,
                    ),
                itemBuilder: (context, index) {
                  Datam allOrder = allOrderProivder.allOrderModel.data[index];

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 17, vertical: 19),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ID: ' + allOrder.id.toString(),
                                style: FontStyles.regularStyle(
                                  fontSize: 14,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff646974),
                                ),
                              ),
                              Text(
                                allOrder.date.toString(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                'Цена:  ' +
                                    allOrder.productTotalSum.toString() +
                                    'сум' +
                                    ' (2500 сум)',
                                style: FontStyles.regularStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Color(0xff646974),
                                ),
                              ),
                              SizedBox(
                                width: 5,
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
                          index == 0
                              ? SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.86,
                                  height: 50,
                                  child: RaisedButton(
                                    elevation: 0,
                                    color: Color(0xff9F111B),
                                    onPressed: () async {
                                      await AcceptOrder.acceptOrder(
                                          allOrder.id);
                                      screenController.selectTwo();
                                      allOrdersController.fetchAllOrders();
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Text(
                                      'Принять заказ',
                                      style: FontStyles.mediumStyle(
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}

/////////////////////////////
///////////////////
///
////
////
////
////
///

// import 'package:HAMD_Delivery/constants/colors.dart';
// import 'package:HAMD_Delivery/constants/fonts.dart';
// import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
// import 'package:HAMD_Delivery/controllers/screen_controller.dart';
// import 'package:HAMD_Delivery/services/accept_order.dart';
// import 'package:HAMD_Delivery/utils/my_prefs.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';

// class AllOrderCard extends StatefulWidget {
//   @override
//   _AllOrderCardState createState() => _AllOrderCardState();
// }

// class _AllOrderCardState extends State<AllOrderCard> {
//   var length;
//   final AllOrdersController allOrdersController =
//       Get.find<AllOrdersController>();
//   final ScreenController screenController = Get.find<ScreenController>();

//   @override
//   void initState() {
//     print('this is all  order to show token');
//     print(MyPref.secondToken);
//     print('this is initstate in all order srcreen');
//     allOrdersController.fetchAllOrders();
//     length = allOrdersController.allOrdersList.length;
//     print('this is legnth');
//     print(length);
//     super.initState();
//   }

//   // @override
//   // void didChangeDependencies() {
//   //   allOrdersController.fetchAllOrders();
//   //   super.didChangeDependencies();
//   //   length = allOrdersController.allOrdersList.length;
//   //   print('this is didchange legnth in main');
//   //   print(length);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       if (allOrdersController.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(
//               ColorPalatte.strongRedColor,
//             ),
//           ),
//         );
//       } else {
//         return RefreshIndicator(
//           color: ColorPalatte.strongRedColor,
//           onRefresh: () => allOrdersController.fetchAllOrders(),
//           child: length < 1
//               // allOrdersController.allOrdersList.isEmpty
//               ? ListView(
//                   children: [
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Center(
//                           child: Text('Заказов пока нет'),
//                         ),
//                       ],
//                     )
//                   ],
//                 )
//               : ListView.separated(
//                   itemCount: allOrdersController.allOrdersList.length,
//                   separatorBuilder: (context, index) => SizedBox(
//                     height: 15,
//                   ),
//                   itemBuilder: (context, index) => Container(
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       color: Colors.white,
//                     ),
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 17, vertical: 19),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 'ID: ' +
//                                     allOrdersController.allOrdersList[index].id
//                                         .toString(),
//                                 style: FontStyles.regularStyle(
//                                   fontSize: 14,
//                                   fontFamily: 'Montserrat',
//                                   color: Color(0xff646974),
//                                 ),
//                               ),
//                               Text(
//                                 allOrdersController.allOrdersList[index].date
//                                     .toString(),
//                                 style: FontStyles.regularStyle(
//                                   fontSize: 14,
//                                   fontFamily: 'Montserrat',
//                                   color: Color(0xff646974),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 25),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Expanded(
//                                 flex: 1,
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width * .1,
//                                   color: Colors.white,
//                                   child: Column(
//                                     children: [
//                                       SvgPicture.asset(
//                                         'assets/icons/location.svg',
//                                         height: 35,
//                                       ),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 5,
//                                         height: 5,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Color(0xffB6C5EE),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 5,
//                                         height: 5,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Color(0xffB6C5EE),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 5,
//                                         height: 5,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Color(0xffB6C5EE),
//                                         ),
//                                       ),
//                                       SizedBox(height: 5),
//                                       Container(
//                                         width: 10,
//                                         height: 10,
//                                         decoration: BoxDecoration(
//                                           shape: BoxShape.circle,
//                                           color: Color(0xff9F111B),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 15,
//                               ),
//                               Expanded(
//                                 flex: 9,
//                                 child: Container(
//                                   width: MediaQuery.of(context).size.width * .9,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         'Заказ из',
//                                         style: FontStyles.regularStyle(
//                                           fontSize: 14,
//                                           fontFamily: 'Montserrat',
//                                           color: Color(0xffAAAEB7),
//                                         ),
//                                       ),
//                                       SizedBox(
//                                         height: 7,
//                                       ),
//                                       Text(
//                                         'HAMD центральный филиал',
//                                         style: FontStyles.boldStyle(
//                                           fontSize: 15,
//                                           fontFamily: 'Montserrat',
//                                           color: Color(0xff232323),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Divider(
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'Цена:  ' +
//                                     allOrdersController
//                                         .allOrdersList[index].productTotalSum
//                                         .toString() +
//                                     'сум' +
//                                     ' (2500 сум)',
//                                 style: FontStyles.regularStyle(
//                                   fontSize: 16,
//                                   fontFamily: 'Montserrat',
//                                   color: Color(0xff646974),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 5,
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Divider(
//                             thickness: 1,
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Row(
//                             children: [
//                               Image.asset('assets/images/cards.png'),
//                               SizedBox(
//                                 width: 7,
//                               ),
//                               Text(
//                                 'Оплата: Наличными',
//                                 style: FontStyles.boldStyle(
//                                   fontSize: 15,
//                                   fontFamily: 'Montserrat',
//                                   color: Colors.black,
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 5,
//                           ),
//                           Divider(
//                             thickness: 1,
//                           ),
//                           index == 0
//                               ? SizedBox(
//                                   width:
//                                       MediaQuery.of(context).size.width * 0.86,
//                                   height: 50,
//                                   child: RaisedButton(
//                                     elevation: 0,
//                                     color: Color(0xff9F111B),
//                                     onPressed: () async {
//                                       await AcceptOrder.acceptOrder(
//                                           allOrdersController
//                                               .allOrdersList[index].id);
//                                       screenController.selectTwo();
//                                       allOrdersController.fetchAllOrders();
//                                     },
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius:
//                                             BorderRadius.circular(15)),
//                                     child: Text(
//                                       'Принять заказ',
//                                       style: FontStyles.mediumStyle(
//                                         fontSize: 16,
//                                         fontFamily: 'Montserrat',
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : Container(),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//         );
//       }
//     });
//   }
// }

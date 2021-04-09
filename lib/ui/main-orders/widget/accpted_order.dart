import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/controllers/accepted_orders_controller.dart';
import 'package:HAMD_Delivery/services/accepted_orders_services.dart';
import 'package:HAMD_Delivery/ui/main-orders/location/maps_sheet.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/my_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:map_launcher/map_launcher.dart';

class AccptedOrders extends StatefulWidget {
  @override
  _AccptedOrdersState createState() => _AccptedOrdersState();
}

class _AccptedOrdersState extends State<AccptedOrders> {
  double destinationLatitude = 41.29146678606526;

  double destinationLongitude = 69.26455854348644;

  String destinationTitle = 'Ocean Beach';

  double originLatitude = 41.2849910828198;

  double originLongitude = 69.25855289260954;

  String originTitle = 'Pier 33';

  List<Coords> waypoints = [
    Coords(41.2849910828198, 69.2585528926095),
    Coords(41.29146678606526, 69.26455854348644),

//41.2849910828198, 69.25855289260954
//41.29146678606526, 69.26455854348644
    // Coords(37.7935754, -122.483654),
  ];
  final AcceptedOrdersController acceptedOrdersController =
      Get.find<AcceptedOrdersController>();

  @override
  void initState() {
    print('init state in accepted oreders');
    acceptedOrdersController.fetchAllAcceptedOrders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('accepted orders');
    print(acceptedOrdersController.allAcceptedOrdersList.length);
    return Obx(
      () {
        if (acceptedOrdersController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                ColorPalatte.strongRedColor,
              ),
            ),
          );
        } else {
          return RefreshIndicator(
            color: ColorPalatte.strongRedColor,
            onRefresh: () => acceptedOrdersController.fetchAllAcceptedOrders(),
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
              itemCount: acceptedOrdersController.allAcceptedOrdersList.length,
              itemBuilder: (context, index) => Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 17, vertical: 19),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Id ${acceptedOrdersController.allAcceptedOrdersList[index].id}',
                            style: FontStyles.regularStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                              color: Color(0xff646974),
                            ),
                          ),
                          Text(
                            acceptedOrdersController
                                .allAcceptedOrdersList[index].date
                                .toString(),
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
                              // onPressed: () => Get.to(() => MapLauncherDemo()),
                              onPressed: () {
                                MapsSheet.show(
                                  context: context,
                                  onMapTap: (map) {
                                    map.showDirections(
                                      destination: Coords(
                                        destinationLatitude,
                                        destinationLongitude,
                                      ),
                                      destinationTitle: destinationTitle,
                                      origin: originLatitude == null ||
                                              originLongitude == null
                                          ? null
                                          : Coords(
                                              originLatitude, originLongitude),
                                      originTitle: originTitle,
                                      waypoints: waypoints,
                                      // directionsMode: directionsMode,
                                    );
                                  },
                                );
                              },
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
            ),
          );
        }
      },
    );
  }
}

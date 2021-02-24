import 'dart:async';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/constants/fonts.dart';
import 'package:HAMD_Delivery/ui/my-drewer/my_drewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentOrder extends StatefulWidget {
  CurrentOrder({Key key}) : super(key: key);

  @override
  _CurrentOrderState createState() => _CurrentOrderState();
}

class _CurrentOrderState extends State<CurrentOrder> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  // ignore: unused_element
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), 'assets/images/marker.png')
        .then((value) => icon = value);
    // new Timer(Duration(seconds: 5), () => {Get.to(NewOrder())});
  }

  // List for storing markers
  Set<Marker> allMarkers = Set<Marker>();
  // Custom marker icon
  BitmapDescriptor icon;

  String status = "ONLINE";
  String buttonText = "Я НА СМЕНЕ";
  Color buttonColor = Colors.green;
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: SizedBox(
        width: MediaQuery.of(context).size.width * .95,
        child: Drawer(
          child: MyDrewer(),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                // add marker
                allMarkers.add(Marker(
                    markerId: MarkerId('Google'),
                    draggable: false,
                    icon: icon,
                    position: LatLng(37.43296265331129, -122.08832357078792)));
              });
            },
            myLocationButtonEnabled: false,
            markers: allMarkers,
            myLocationEnabled: true,
            compassEnabled: false,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 50.0),
                color: Colors.white,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu, size: 24, color: Colors.black),
                      onPressed: () {
                        _openDrawer();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Text(
                            "Принятый заказ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Оплата заказа: Наличными',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: 45.0,
                        height: 45.0,
                        decoration: BoxDecoration(
                          color: ColorPalatte.callButtonBackground,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  Offset(0, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            left: 20.0,
            right: 20.0,
            bottom: 30.0,
            child: Column(
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.rotate(
                    angle: 3.14,
                    child: IconButton(
                      icon: Icon(Icons.navigation),
                      onPressed: () {},
                      iconSize: 35.0,
                      color: ColorPalatte.strongRedColor,
                    ),
                  ),
                ),
                ClipPath(
                  clipper: DolDurmaClipper(right: 160.0, holeRadius: 50.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorPalatte.mainPageColor,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: width,
                    height: 363.0,
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        SizedBox(height: 10.0),
                        Center(
                          child: Container(
                            width: 40.0,
                            height: 4.0,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Заказ D 275',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 28.0),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 50.0,
                            vertical: 25.0,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: ColorPalatte.callButtonBackground,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.map,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: ColorPalatte.callButtonBackground,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chat,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 56.0,
                                height: 56.0,
                                decoration: BoxDecoration(
                                  color: ColorPalatte.callButtonBackground,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(
                                          0, 4), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.car_repair,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Flexible(
                          child: SizedBox(
                            width: double.infinity,
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              color: ColorPalatte.strongRedColor,
                              elevation: 0,
                              child: Text(
                                'ПОЕХАЛИ К КЛИЕНТУ',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DolDurmaClipper extends CustomClipper<Path> {
  DolDurmaClipper({@required this.right, @required this.holeRadius});

  final double right;
  final double holeRadius;

  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width - right - holeRadius, 0.0)
      ..arcToPoint(
        Offset(size.width - right, 0),
        clockwise: false,
        radius: Radius.circular(1),
      )
      ..lineTo(size.width, 0.0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - right, size.height);

    path.lineTo(0.0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(DolDurmaClipper oldClipper) => true;
}

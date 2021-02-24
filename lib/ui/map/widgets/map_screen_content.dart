import 'dart:async';

import 'package:HAMD_Delivery/ui/my_drewer/my_drewer.dart';
// import 'package:HAMD_Delivery/ui/new-order/new-order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenContent extends StatefulWidget {
  @override
  State<MapScreenContent> createState() => MapScreenContentState();
}

class MapScreenContentState extends State<MapScreenContent> {
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
    // BitmapDescriptor.fromAssetImage(
    //         ImageConfiguration(), 'assets/images/marker.png')
    //     .then((value) => icon = value);
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
    return new Scaffold(
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 50),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.menu, size: 24, color: Colors.black),
                  onPressed: () {
                    _openDrawer();
                  },
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "Текущий статус $status",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Text(
            buttonText,
          ),
        ),
        backgroundColor: buttonColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _goToTheLake() {
    setState(() {
      var isOnline = buttonColor == Colors.green;
      if (isOnline) {
        buttonColor = Colors.red;
        status = "OFFLINE";
        buttonText = "ЗАКОНЧИТЬ СМЕНУ";
      } else {
        buttonColor = Colors.green;
        status = "ONLINE";
        buttonText = "Я НА СМЕНЕ";
      }
    });
  }
}

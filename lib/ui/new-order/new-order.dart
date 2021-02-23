import 'dart:async';

import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/ui/new-order/widgets/new-order-card.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewOrder extends StatefulWidget {
  NewOrder({Key key}) : super(key: key);

  @override
  _NewOrderState createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
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
  }

  // List for storing markers
  Set<Marker> allMarkers = Set<Marker>();
  // Custom marker icon
  BitmapDescriptor icon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              setState(() {
                allMarkers.add(Marker(
                    markerId: MarkerId('Google'),
                    draggable: false,
                    icon: icon,
                    position: LatLng(37.43296265331129, -122.08832357078792)));
              });
            },
            myLocationButtonEnabled: false,
            myLocationEnabled: true,
            compassEnabled: false,
            markers: allMarkers,
          ),
        ],
      ),
    );
  }
}

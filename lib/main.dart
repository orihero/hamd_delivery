import 'package:HAMD_Delivery/ui/landing/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LandingScreen(),
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';

// // import 'Constants.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Polyline example',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.orange,
//       ),
//       home: MapScreen(),
//     );
//   }
// }

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController mapController;
//   double _originLatitude = 41.285156777378916, _originLongitude = 69.25864019223779;
//   double _destLatitude = 41.28191576327238, _destLongitude = 69.26260986135695;
//   // 41.285156777378916, 69.25864019223779
//   // 41.28191576327238, 69.26260986135695
//   Map<MarkerId, Marker> markers = {};
//   Map<PolylineId, Polyline> polylines = {};
//   List<LatLng> polylineCoordinates = [];
//   PolylinePoints polylinePoints = PolylinePoints();
//   String googleAPiKey = "AIzaSyA9lIVEXUvvgivZuVMEasMU_ejHYsdYmHg";

//   @override
//   void initState() {
//     super.initState();

//     /// origin marker
//     _addMarker(LatLng(_originLatitude, _originLongitude), "origin",
//         BitmapDescriptor.defaultMarker);

//     /// destination marker
//     _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
//         BitmapDescriptor.defaultMarkerWithHue(90));
//     _getPolyline();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           body: GoogleMap(
//             initialCameraPosition: CameraPosition(
//                 target: LatLng(_originLatitude, _originLongitude), zoom: 15),
//             myLocationEnabled: true,
//             tiltGesturesEnabled: true,
//             compassEnabled: true,
//             scrollGesturesEnabled: true,
//             zoomGesturesEnabled: true,
//             onMapCreated: _onMapCreated,
//             markers: Set<Marker>.of(markers.values),
//             polylines: Set<Polyline>.of(polylines.values),
//           )),
//     );
//   }

//   void _onMapCreated(GoogleMapController controller) async {
//     mapController = controller;
//   }

//   _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
//     MarkerId markerId = MarkerId(id);
//     Marker marker =
//     Marker(markerId: markerId, icon: descriptor, position: position);
//     markers[markerId] = marker;
//   }

//   _addPolyLine() {
//     PolylineId id = PolylineId("poly");
//     Polyline polyline = Polyline(
//         polylineId: id, color: Colors.red, points: polylineCoordinates);
//     polylines[id] = polyline;
//     setState(() {});
//   }

//   _getPolyline() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         "AIzaSyA9lIVEXUvvgivZuVMEasMU_ejHYsdYmHg",
//         PointLatLng(_originLatitude, _originLongitude),
//         PointLatLng(_destLatitude, _destLongitude),
//         travelMode: TravelMode.driving,
//       wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
//     );
//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }
//     _addPolyLine();
//   }
// }



// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';

// void main() => runApp(MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: MapPage(),
//     ));

// const double CAMERA_ZOOM = 13;
// const double CAMERA_TILT = 0;
// const double CAMERA_BEARING = 30;
// const LatLng SOURCE_LOCATION = LatLng(42.7477863, -71.1699932);
// const LatLng DEST_LOCATION = LatLng(42.6871386, -71.2143403);

// class MapPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => MapPageState();
// }

// class MapPageState extends State<MapPage> {
//     Completer<GoogleMapController> _controller = Completer();
//     // this set will hold my markers
//     Set<Marker> _markers = {};
//     // this will hold the generated polylines
//     Set<Polyline> _polylines = {};
//     // this will hold each polyline coordinate as Lat and Lng pairs
//     List<LatLng> polylineCoordinates = [];
//     // this is the key object - the PolylinePoints
//     // which generates every polyline between start and finish
//     PolylinePoints polylinePoints = PolylinePoints();
//     String googleAPIKey = "AIzaSyA9lIVEXUvvgivZuVMEasMU_ejHYsdYmHg";
//     // for my custom icons
//     BitmapDescriptor sourceIcon;
//     BitmapDescriptor destinationIcon;

//     @override
//     void initState() {
//       super.initState();
//       setSourceAndDestinationIcons();
//     }

//     void setSourceAndDestinationIcons() async {
//       sourceIcon = await BitmapDescriptor.fromAssetImage(
//           ImageConfiguration(devicePixelRatio: 2.5), 'assets/driving_pin.png');
//       destinationIcon = await BitmapDescriptor.fromAssetImage(
//           ImageConfiguration(devicePixelRatio: 2.5),
//           'assets/destination_map_marker.png');
//     }

//     @override
//     Widget build(BuildContext context) {
//       CameraPosition initialLocation = CameraPosition(
//           zoom: CAMERA_ZOOM,
//           bearing: CAMERA_BEARING,
//           tilt: CAMERA_TILT,
//           target: SOURCE_LOCATION);
//       return GoogleMap(
//           myLocationEnabled: true,
//           compassEnabled: true,
//           tiltGesturesEnabled: false,
//           markers: _markers,
//           polylines: _polylines,
//           mapType: MapType.normal,
//           initialCameraPosition: initialLocation,
//           onMapCreated: onMapCreated);
//     }

//     void onMapCreated(GoogleMapController controller) {
//       controller.setMapStyle(Utils.mapStyles);
//       _controller.complete(controller);
//       setMapPins();
//       setPolylines();
//     }

//     void setMapPins() {
//       setState(() {
//         // source pin
//         _markers.add(Marker(
//             markerId: MarkerId('sourcePin'),
//             position: SOURCE_LOCATION,
//             icon: sourceIcon));
//         // destination pin
//         _markers.add(Marker(
//             markerId: MarkerId('destPin'),
//             position: DEST_LOCATION,
//             icon: destinationIcon));
//       });
//     }

//     setPolylines() async {

//         List<PointLatLng> result = await polylinePoints?.getRouteBetweenCoordinates(
//             googleAPIKey,
//             SOURCE_LOCATION.latitude,
//             SOURCE_LOCATION.longitude,
//             DEST_LOCATION.latitude,
//             DEST_LOCATION.longitude,);
//         if (result.isNotEmpty) {
//           // loop through all PointLatLng points and convert them
//           // to a list of LatLng, required by the Polyline
//           result.forEach((PointLatLng point) {
//             polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//           });
//         }

//       setState(() {
//           // create a Polyline instance
//           // with an id, an RGB color and the list of LatLng pairs
//           Polyline polyline = Polyline(
//               polylineId: PolylineId("poly"),
//               color: Color.fromARGB(255, 40, 122, 198),
//               points: polylineCoordinates);

//           // add the constructed polyline as a set of points
//           // to the polyline set, which will eventually
//           // end up showing up on the map
//           _polylines.add(polyline);
//       });
//   }
// }

// class Utils {
//   static String mapStyles = '''[
//   {
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.icon",
//     "stylers": [
//       {
//         "visibility": "off"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "elementType": "labels.text.stroke",
//     "stylers": [
//       {
//         "color": "#f5f5f5"
//       }
//     ]
//   },
//   {
//     "featureType": "administrative.land_parcel",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#bdbdbd"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "poi",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "poi.park",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "road",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#ffffff"
//       }
//     ]
//   },
//   {
//     "featureType": "road.arterial",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#757575"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#dadada"
//       }
//     ]
//   },
//   {
//     "featureType": "road.highway",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#616161"
//       }
//     ]
//   },
//   {
//     "featureType": "road.local",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.line",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#e5e5e5"
//       }
//     ]
//   },
//   {
//     "featureType": "transit.station",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#eeeeee"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "geometry",
//     "stylers": [
//       {
//         "color": "#c9c9c9"
//       }
//     ]
//   },
//   {
//     "featureType": "water",
//     "elementType": "labels.text.fill",
//     "stylers": [
//       {
//         "color": "#9e9e9e"
//       }
//     ]
//   }
// ]''';
// }
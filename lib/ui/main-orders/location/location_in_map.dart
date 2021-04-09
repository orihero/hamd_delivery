import 'package:HAMD_Delivery/ui/main-orders/location/show_directions.dart';
import 'package:HAMD_Delivery/ui/main-orders/location/show_marker.dart';
import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'show_directions.dart';
import 'show_marker.dart';

class MapLauncherDemo extends StatefulWidget {
  @override
  _MapLauncherDemoState createState() => _MapLauncherDemoState();
}

enum LaunchMode { marker, directions }

class _MapLauncherDemoState extends State<MapLauncherDemo> {
  int selectedTabIndex = 0;

  List<Widget> widgets = [ShowMarker(), ShowDirections()];

  List<Coords> waypoints = [
    Coords(41.2849910828198, 69.2585528926095),
    Coords(41.29146678606526, 69.26455854348644),

//41.2849910828198, 69.25855289260954
//41.29146678606526, 69.26455854348644
    // Coords(37.7935754, -122.483654),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Launcher Demo'),
      ),

      body: ShowDirections(),
      //  body: widgets[selectedTabIndex],
      //   bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: selectedTabIndex,
      //     onTap: (newTabIndex) => setState(() {
      //       selectedTabIndex = newTabIndex;
      //     }),
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.pin_drop),
      //         title: Text('Marker'),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.directions),
      //         title: Text('Directions'),
      //       ),
      //     ],
      //   ),
    );
  }
}

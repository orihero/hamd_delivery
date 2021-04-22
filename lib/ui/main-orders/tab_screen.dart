import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/controllers/all_orders_controller.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/accpted_order.dart';
import 'package:HAMD_Delivery/ui/main-orders/widget/all_order_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenPage createState() => _HomeScreenPage();
// }

// class _HomeScreenPage extends State<HomeScreen>
//     with SingleTickerProviderStateMixin {
//   TabController tabController;

//   String title = "Home";

//   @override
//   void initState() {
//     print('this is init state in  tab');
//     super.initState();
//     tabController = new TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//         theme: ThemeData(
//             primarySwatch: Colors.purple,
//             brightness: Brightness.light,
//             accentColor: Colors.red),
//         darkTheme: ThemeData(
//           brightness: Brightness.dark,
//         ),
//         home: new Scaffold(
//           appBar: AppBar(
//             title: Text(title),
//             centerTitle: true,
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               FirstTab(),
//               MyBody("Page Two"),
//               MyBody("Page Three")
//             ],
// // if you want yo disable swiping in tab the use below code
// //            physics: NeverScrollableScrollPhysics(),
//             controller: tabController,
//           ),
//           bottomNavigationBar: Material(
//             color: Colors.purple,
//             child: TabBar(
//               onTap: (indedx) {
//                 if (indedx == 0) {
//                   setState(() {
//                     title = "Home";
//                   });
//                 } else if (indedx == 1) {
//                   setState(() {
//                     title = "Tab Two";
//                   });
//                 } else if (indedx == 2) {
//                   setState(() {
//                     title = "Tab Three";
//                   });
//                 }
//               },
//               indicatorColor: Colors.blue,
//               unselectedLabelColor: Colors.grey,
//               tabs: <Widget>[
//                 Tab(
//                   icon: Icon(Icons.favorite_border),
//                   text: "ONE",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.favorite),
//                   text: "TWO",
//                 ),
//                 Tab(
//                   icon: Icon(Icons.add_box),
//                   text: "THREE",
//                 ),
//               ],
//               controller: tabController,
//             ),
//           ),
//         ));
//   }
// }

class FirstTab extends StatefulWidget {
  @override
  FirstTabState createState() => FirstTabState();
}

class FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  var length;
  final AllOrdersController allOrdersController =
      Get.find<AllOrdersController>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
    print('this is initstate in all order srcreen');
    allOrdersController.fetchAllOrders();
    length = allOrdersController.allOrdersList.length;
    print('this is legnth');
    print(length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    allOrdersController.fetchAllOrders();
    super.didChangeDependencies();
    length = allOrdersController.allOrdersList.length;
    print('this is legnth in main');
    print(length);
  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize:
              Size.fromHeight(100 + MediaQuery.of(context).viewPadding.top),
          child: Column(
            children: [
              customAppBar(
                context,
                title: 'Главная',
                onpress1: () => _openDrawer(),
                icon: IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                      size: 26,
                    ),
                    onPressed: _openDrawer),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: ColorPalatte.strongRedColor,
                ),
                height: 50.0,
                child: new TabBar(
                  indicatorColor: ColorPalatte.strongRedColor,
                  unselectedLabelColor: Colors.black,
                  labelColor: Colors.white,
                  tabs: [
                    Tab(
                      text: "231",
                    ),
                    Tab(
                      text: "TWO",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AllOrderCard(),
            AccptedOrders(),

            // Text("TAB ONE CONTENT"),
            // Text("TAB TWO CONTENT"),
            // Text("TAB THREE CONTENT"),
          ],
        ),
      ),
    );
  }
}

// class MyBody extends StatelessWidget {
//   final String title;

//   MyBody(this.title);

//   final mySnackBar = SnackBar(
//     content: Text(
//       "Hello There!",
//       style: TextStyle(color: Colors.white),
//     ),
//     duration: Duration(seconds: 3),
//     backgroundColor: Colors.blue,
//   );

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Container(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           RaisedButton(
//               child: Text(title + "  Click me"),
//               onPressed: () => {Scaffold.of(context).showSnackBar(mySnackBar)}),
//         ],
//       ),
//     );
//   }
// }

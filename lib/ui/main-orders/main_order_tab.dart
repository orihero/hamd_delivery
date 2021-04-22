import 'package:HAMD_Delivery/constants/colors.dart';
import 'package:HAMD_Delivery/ui/components/cutom_appbar.dart';
import 'package:HAMD_Delivery/ui/my-drewer/my_drewer.dart';
import 'package:flutter/material.dart';

class MainOrderTab extends StatefulWidget {
  @override
  _MainOrderTabState createState() => _MainOrderTabState();
}

class _MainOrderTabState extends State<MainOrderTab>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ColorPalatte.mainPageColor,
        key: _scaffoldKey,
        drawer: SizedBox(
          width: MediaQuery.of(context).size.width * .85,
          child: Drawer(
            child: MyDrewer(),
          ),
        ),
        appBar: PreferredSize(
          child: customAppBar(
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
          preferredSize: Size.fromHeight(
              kToolbarHeight + MediaQuery.of(context).viewPadding.top),
        ),
        body: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.blue,
              tabs: [
                Tab(
                  text: "ONE",
                ),
                Tab(
                  text: "TWO",
                ),
                // Tab(
                //   text: "THREE",
                // ),
              ],
            ),
            TabBarView(
              children: [
                Text("TAB ONE CONTENT"),
                Text("TAB TWO CONTENT"),
                // Text("TAB THREE CONTENT"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

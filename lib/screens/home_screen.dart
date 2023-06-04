import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:munchmate/screens/last_orders_screen.dart';
import 'package:munchmate/screens/menu_screen.dart';
import 'package:munchmate/screens/orders_screen.dart';
import 'package:munchmate/utils/colors.dart';
import 'package:munchmate/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: 0,
  );
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: SafeArea(
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            backgroundColor: primaryColor,
            shadowColor: blackColor,
            elevation: 5.0,
            child: ListView(
              children: [
                DrawerHeader(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Lottie.asset(
                            "assets/jsons/fast-food.json",
                            height: height * 0.1,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    user.name,
                                    style: TextStyle(
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          user.email,
                          style: TextStyle(
                            fontSize: width * 0.035,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(
                    'Home',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                  leading: Image(
                    image: Image.asset("assets/images/home.png").image,
                    color: whiteColor,
                    height: width * 0.08,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Switch Theme',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                  leading: Image(
                    image: Image.asset("assets/images/theme.png").image,
                    color: whiteColor,
                    height: width * 0.08,
                  ),
                  onTap: () {
                    setState(() {
                      darkMode = true;
                    });
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Report Problem',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                  leading: Image(
                    image:
                        Image.asset("assets/images/report-problem.png").image,
                    color: whiteColor,
                    height: width * 0.08,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                      color: whiteColor,
                      fontSize: width * 0.045,
                    ),
                  ),
                  leading: Image(
                    image: Image.asset("assets/images/logout.png").image,
                    color: whiteColor,
                    height: width * 0.08,
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
        drawerDragStartBehavior: DragStartBehavior.start,
        drawerEnableOpenDragGesture: true,
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "MunchMate",
            style: TextStyle(
              fontSize: width * 0.06,
            ),
          ),
          bottom: TabBar(
              controller: _tabController,
              indicatorColor: backgroundColor,
              labelStyle: TextStyle(
                fontSize: width * 0.045,
              ),
              tabs: const [
                Tab(
                  text: 'Menu',
                ),
                Tab(
                  icon: Icon(Icons.history),
                  // text: 'Recent Orders',
                )
              ]),
        ),
        backgroundColor: backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => Dialog(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                backgroundColor: backgroundColor,
                child: const OrdersScreen(),
              ),
            );
          },
          tooltip: "Your Cart",
          child: Icon(
            Icons.fastfood_rounded,
            color: whiteColor,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MenuScreen(
              width: width,
              height: height,
              context: context,
            ),
            const LastOrders(),
          ],
        ));
  }
}

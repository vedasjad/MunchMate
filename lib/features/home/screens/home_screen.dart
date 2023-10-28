import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:munchmate/features/home/widgets/orders_screen.dart';
import 'package:munchmate/features/menu/screens/menu_screen.dart';
import 'package:munchmate/features/ordersHistory/screens/last_orders_screen.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../common/constants.dart';
import '../../../provider/localUserProvider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
      animationDuration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
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
            physics: const BouncingScrollPhysics(),
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
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: height * 0.05,
                            backgroundImage: NetworkImage(
                              Provider.of<LocalUserProvider>(context)
                                  .localUser
                                  .photoURL,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Provider.of<LocalUserProvider>(context)
                                      .localUser
                                      .name,
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
                        Provider.of<LocalUserProvider>(context).localUser.email,
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
                  'Terms and Conditions',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.asset("assets/images/terms-and-conditions.png")
                      .image,
                  color: whiteColor,
                  height: width * 0.08,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Privacy Policy',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.asset("assets/images/privacy-policy.png").image,
                  color: whiteColor,
                  height: width * 0.08,
                ),
                onTap: () {
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
                  image: Image.asset("assets/images/report-problem.png").image,
                  color: whiteColor,
                  height: width * 0.08,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Contact Us',
                  style: TextStyle(
                    color: whiteColor,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.asset("assets/images/contact-us.png").image,
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
                onTap: () async {
                  await GoogleSignIn().disconnect();
                  await FirebaseAuth.instance.signOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      drawerDragStartBehavior: DragStartBehavior.start,
      drawerEnableOpenDragGesture: true,
      backgroundColor: backgroundColor,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => const Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              backgroundColor: backgroundColor,
              child: OrdersScreen(),
            ),
          );
        },
        label: const Text("Your Order"),
        icon: const Icon(
          Icons.fastfood_rounded,
          color: whiteColor,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: primaryColor,
              stretchTriggerOffset: 0.1,
              leading: Builder(builder: (context) {
                return IconButton(
                  splashRadius: 0.1,
                  onPressed: () => Scaffold.of(context).openDrawer(),
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                  icon: const Icon(
                    Icons.notes_rounded,
                  ),
                );
              }),
              title: Text(
                "MunchMate",
                style: TextStyle(
                  fontSize: width * 0.06,
                ),
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: whiteColor,
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
                ],
              ),
            ),
          ];
        },
        body: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: TabBarView(
            controller: _tabController,
            children: [
              MenuScreen(
                width: width,
                height: height,
                context: context,
              ),
              const LastOrders(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:munchmate/utils/colors.dart';

const headers = ["All", "Snacks", "Drinks", "Meals", "Favourites"];
const headerIcons = [
  "https://freesvg.org/img/fast-food-menu.png",
  "https://freesvg.org/img/1548610988.png",
  "https://freesvg.org/img/Gerald_G_Fast_Food_Drinks_(FF_Menu)_5.png",
  "https://freesvg.org/img/publicdomainq-bento.png",
  "https://img.icons8.com/tiny-color/64/like.png",
];
var selectedHeader = headers[0];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          shadowColor: Colors.black,
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
                        Lottie.network(
                          "https://assets9.lottiefiles.com/temp/lf20_nXwOJj.json",
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
                                  'Mohd Asjad Raza Ansari',
                                  style: TextStyle(
                                    fontSize: width * 0.045,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
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
                        'mohdasjad2112073@akgec.ac.in',
                        style: TextStyle(
                          fontSize: width * 0.035,
                          color: Colors.white,
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
                    color: Colors.white,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.network(
                          "https://img.icons8.com/fluency-systems-regular/48/home.png")
                      .image,
                  color: Colors.white,
                  height: width * 0.08,
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Theme',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.network(
                          "https://img.icons8.com/external-linear-outline-icons-papa-vector/78/external-Light-Mode-interface-linear-outline-icons-papa-vector.png")
                      .image,
                  color: Colors.white,
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
                    color: Colors.white,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.network(
                          "https://img.icons8.com/puffy/32/experimental-error-puffy.png")
                      .image,
                  color: Colors.white,
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
                    color: Colors.white,
                    fontSize: width * 0.045,
                  ),
                ),
                leading: Image(
                  image: Image.network(
                          "https://img.icons8.com/sf-regular/48/logout-rounded.png")
                      .image,
                  color: Colors.white,
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
        // elevation: 0,
        title: Text(
          "MunchMate",
          style: TextStyle(
            fontSize: width * 0.06,
          ),
        ),
      ),
      backgroundColor: backgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {},
        tooltip: "Your Cart",
        child: const Icon(
          Icons.fastfood_rounded,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.zero,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(backgroundColor),
                            shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                ),
                              ),
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.055,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.zero,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(backgroundColor),
                            shape: const MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                ),
                              ),
                            ),
                            elevation: const MaterialStatePropertyAll(0),
                            splashFactory: NoSplash.splashFactory,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Recent Orders',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.055,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemExtent: width / 5.3,
                    shrinkWrap: true,
                    itemCount: headers.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            selectedHeader = headers[index];
                          });
                        },
                        splashFactory: NoSplash.splashFactory,
                        child: HeaderButton(
                          width: width,
                          network: headerIcons[index],
                          title: headers[index],
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: width * 0.03,
                      mainAxisSpacing: 0.0,
                      mainAxisExtent: height / 4.3,
                    ),
                    itemCount: 8,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext ctx, index) {
                      return ItemCard(height: height, width: width);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height / 6,
          width: width / 2.5,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            color: Colors.white,
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Image.network(
                  "https://tse4.mm.bing.net/th?id=OIP.L0W1f9Vubv05fn-C63I5UwHaGq&pid=Api&P=0&h=180",
                  fit: BoxFit.fitWidth,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        Colors.black,
                      ],
                      stops: const [0.25, 1.0],
                    ),
                    // backgroundBlendMode: BlendMode.dstOut,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.favorite_border_rounded,
                          size: width * 0.05,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Chhole Bhature',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: width * 0.037,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: width / 10,
          width: width / 2.5,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: const EdgeInsets.all(5),
          decoration: const BoxDecoration(
            color: Colors.white,
            // boxShadow: [
            //   BoxShadow(
            //     color: Colors.black12,
            //     blurRadius: 5,
            //     spreadRadius: 1,
            //   )
            // ],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ₹ 100',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: width * 0.04,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(secondaryColor),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: width * 0.04,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class HeaderButton extends StatefulWidget {
  const HeaderButton(
      {required this.width,
      required this.title,
      required this.network,
      Key? key})
      : super(key: key);
  final double width;
  final String title;
  final String network;

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(
              widget.width * 0.02, 10, widget.width * 0.02, 5),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ],
            shape: BoxShape.circle,
            color:
                (selectedHeader == widget.title) ? primaryColor : Colors.white,
          ),
          child: Image.network(
            widget.network,
            width: widget.width * 0.075,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: widget.width * 0.034,
          ),
        ),
      ],
    );
  }
}

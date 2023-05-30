import 'package:flutter/material.dart';
import 'package:munchmate/utils/colors.dart';

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
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "In Today's Menu",
                    style: TextStyle(
                      fontSize: width * 0.065,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    HeaderButton(
                      width: width,
                      network: "https://freesvg.org/img/1548610988.png",
                      title: "Snacks",
                    ),
                    HeaderButton(
                      width: width,
                      network:
                          "https://freesvg.org/img/Gerald_G_Fast_Food_Drinks_(FF_Menu)_5.png",
                      title: "Drinks",
                    ),
                    HeaderButton(
                      width: width,
                      network:
                          "https://freesvg.org/img/publicdomainq-bento.png",
                      title: "Meals",
                    ),
                  ],
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

class HeaderButton extends StatelessWidget {
  const HeaderButton({
    super.key,
    required this.width,
    required this.title,
    required this.network,
  });

  final double width;
  final String title;
  final String network;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: width * 0.02),
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network(
              network,
              width: width * 0.06,
              fit: BoxFit.fitWidth,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: width * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

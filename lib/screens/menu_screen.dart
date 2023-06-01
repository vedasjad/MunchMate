import 'package:flutter/material.dart';
import 'package:munchmate/utils/constants.dart';
import 'package:munchmate/widgets/header_button.dart';
import 'package:munchmate/widgets/item_card.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    required this.width,
    required this.height,
    required this.context,
    Key? key,
  }) : super(key: key);
  final double width;
  final double height;
  final BuildContext context;

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: widget.height * 0.1,
                margin: const EdgeInsets.only(top: 5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: widget.width / 5.3,
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
                        width: widget.width,
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
                    crossAxisSpacing: widget.width * 0.03,
                    mainAxisSpacing: 0.0,
                    mainAxisExtent: widget.height / 4.3,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (
                    BuildContext ctx,
                    index,
                  ) {
                    return ItemCard(
                      height: widget.height,
                      width: widget.width,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

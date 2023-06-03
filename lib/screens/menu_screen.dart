import 'package:flutter/material.dart';
import 'package:munchmate/models/item.dart';
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
  List<Item> selectedItemTypeList = [];
  countItemType(String itemType) {
    for (int index = 0; index < items.length; index++) {
      if (items[index].toMap()['type'] == selectedItemType ||
          selectedItemType == "All") {
        selectedItemTypeList.add(items[index]);
      }
    }
    return selectedItemTypeList.length;
  }

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
                  itemCount: itemTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          selectedItemType = itemTypes[index];
                          selectedItemTypeList = [];
                        });
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: HeaderButton(
                        width: widget.width,
                        network: headerIcons[index],
                        title: itemTypes[index],
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
                  itemCount: countItemType(selectedItemType),
                  shrinkWrap: true,
                  itemBuilder: (
                    BuildContext ctx,
                    index,
                  ) {
                    return ItemCard(
                      item: selectedItemTypeList[index],
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

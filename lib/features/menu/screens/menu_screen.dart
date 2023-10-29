import 'dart:async';

import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/common/constants.dart';
import 'package:munchmate/features/menu/widgets/header_button.dart';
import 'package:munchmate/features/menu/widgets/item_card.dart';
import 'package:provider/provider.dart';

import '../../../provider/menu_provider.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future _refresh() async {
    setState(() {});
  }

  late Timer _timer;

  void startUpdatingData() {
    _timer = Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
      Provider.of<MenuProvider>(context, listen: false).updateSelectedItemType(
          Provider.of<MenuProvider>(context, listen: false).selectedItemType,
          context);
    });
  }

  @override
  void initState() {
    Provider.of<MenuProvider>(context, listen: false).getAllItems();
    startUpdatingData();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: RefreshIndicator(
        color: primaryColor,
        onRefresh: _refresh,
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.09,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemExtent: screenWidth / 5.3,
                  shrinkWrap: true,
                  itemCount: itemTypes.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Provider.of<MenuProvider>(context, listen: false)
                            .updateSelectedItemType(itemTypes[index], context);
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: HeaderButton(
                        width: screenWidth,
                        asset: headerIcons[index],
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
                  // semanticChildCount: ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: screenWidth * 0.03,
                    mainAxisSpacing: 0.0,
                    mainAxisExtent: screenHeight / 4.3,
                  ),
                  itemCount: Provider.of<MenuProvider>(context)
                      .selectedItemTypeList
                      .length,
                  shrinkWrap: true,
                  itemBuilder: (
                    BuildContext ctx,
                    index,
                  ) {
                    return ItemCard(
                      parentContext: context,
                      item: Provider.of<MenuProvider>(context)
                          .selectedItemTypeList[index],
                      height: screenHeight,
                      width: screenWidth,
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.1,
              )
            ],
          ),
        ),
      ),
    );
  }
}

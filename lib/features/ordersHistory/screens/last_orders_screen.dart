import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/features/ordersHistory/widgets/last_order_card.dart';
import 'package:provider/provider.dart';

import '../../../provider/localUserProvider.dart';

class LastOrders extends StatefulWidget {
  const LastOrders({Key? key}) : super(key: key);

  @override
  State<LastOrders> createState() => _LastOrdersState();
}

class _LastOrdersState extends State<LastOrders> {
  Future<void> _refresh() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<bool> expandCard = List<bool>.generate(
        Provider.of<LocalUserProvider>(context).localUser.lastOrders.length,
        (index) => false);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: RefreshIndicator(
          color: primaryColor,
          onRefresh: _refresh,
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10),
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: Provider.of<LocalUserProvider>(context)
                      .localUser
                      .lastOrders
                      .length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          expandCard[index] = !expandCard[index];
                        });
                      },
                      borderRadius: BorderRadius.circular(15),
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      child: LastOrderCard(
                        width: width,
                        height: height,
                        expand: expandCard[index],
                        order: Provider.of<LocalUserProvider>(context)
                            .localUser
                            .lastOrders[index],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

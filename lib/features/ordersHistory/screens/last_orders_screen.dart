import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/features/ordersHistory/widgets/last_order_card.dart';
import 'package:munchmate/provider/last_order_card_provider.dart';
import 'package:provider/provider.dart';

import '../../../provider/localUserProvider.dart';

class LastOrders extends StatefulWidget {
  const LastOrders({Key? key}) : super(key: key);

  @override
  State<LastOrders> createState() => _LastOrdersState();
}

class _LastOrdersState extends State<LastOrders> {
  @override
  void initState() {
    Provider.of<LocalUserProvider>(context, listen: false)
        .getLastOrders(context);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    Provider.of<LastOrderCardProvider>(context, listen: false)
        .fillExpandCardList(
            Provider.of<LocalUserProvider>(context, listen: false)
                .localUser
                .lastOrders
                .length);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: RefreshIndicator(
          color: primaryColor,
          onRefresh: () async {},
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(top: 10),
            physics: const BouncingScrollPhysics(
                parent: NeverScrollableScrollPhysics()),
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
                      onTap: () => Provider.of<LastOrderCardProvider>(context,
                              listen: false)
                          .toggleCard(index),
                      borderRadius: BorderRadius.circular(15),
                      splashFactory: NoSplash.splashFactory,
                      splashColor: Colors.transparent,
                      child: LastOrderCard(
                        index: index,
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

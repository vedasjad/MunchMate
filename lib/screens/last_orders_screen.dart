import 'package:flutter/material.dart';
import 'package:munchmate/models/order.dart';
import 'package:munchmate/utils/constants.dart';
import 'package:munchmate/widgets/last_order_card.dart';

class LastOrders extends StatefulWidget {
  const LastOrders({Key? key}) : super(key: key);

  @override
  State<LastOrders> createState() => _LastOrdersState();
}

class _LastOrdersState extends State<LastOrders> {
  var expandCard =
      List<bool>.filled(user.lastOrders.length, false, growable: true);
  final Iterable<Order> revUserLastOrders = user.lastOrders.reversed;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: user.lastOrders.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        expandCard[index] = !expandCard[index];
                      });
                    },
                    child: LastOrderCard(
                      width: width,
                      height: height,
                      expand: expandCard[index],
                      order: revUserLastOrders.elementAt(index),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

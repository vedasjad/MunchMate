import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:munchmate/utils/colors.dart';
import 'package:munchmate/utils/constants.dart';
import 'package:munchmate/utils/utils.dart';
import 'package:munchmate/widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  calculateTotal(int newTotal) {
    updateState(newTotal);
  }

  updateState(int newTotal) {
    setState(() {
      totalAmount = newTotal;
    });
  }

  @override
  Widget build(BuildContext context) {
    totalAmount = 0;
    for (int index = 0; index < order.items.length; index++) {
      totalAmount += (order.items[index].price * order.itemCounts[index]);
      if (order.itemCounts[index] == 0) {
        order.itemCounts.removeAt(index);
        order.items.removeAt(index);
      }
    }
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.6,
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primaryColor,
            title: Text(
              "My Order",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: width * 0.05,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.44,
                  child: (order.items.isEmpty)
                      ? Lottie.asset(
                          "assets/jsons/rain.json",
                          width: width * 0.8,
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: order.items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return OrderCard(
                              index: index,
                              recalculateTotal: calculateTotal,
                            );
                          },
                        ),
                ),
                Text(
                  "Total : ₹ $totalAmount",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: width * 0.05,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(primaryColor),
                        ),
                        onPressed: () {
                          if (order.items.isEmpty) {
                            showToast('Select items to order!');
                            return;
                          }
                          setState(() {
                            order.dateTime = DateTime.now();
                            order.id = (user.lastOrders.length + 1).toString();
                            order.totalPrice = totalAmount;
                            user.lastOrders.add(order);
                            order = order.copyWith(
                              items: [],
                              itemCounts: [],
                              totalPrice: 0,
                              dateTime: DateTime(2023),
                            );
                            totalAmount = 0;
                          });
                          showToast('Ordered!');
                        },
                        child: Text(
                          'Pay',
                          style: TextStyle(
                            fontSize: width * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

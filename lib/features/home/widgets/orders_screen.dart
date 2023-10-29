import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/common/utils/utils.dart';
import 'package:munchmate/features/home/widgets/order_card.dart';
import 'package:provider/provider.dart';

import '../../../provider/localUserProvider.dart';
import '../../../provider/orderProvider.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
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
                  child:
                      (Provider.of<OrderProvider>(context).order.items.isEmpty)
                          ? Lottie.asset(
                              "assets/jsons/rain.json",
                              width: width * 0.8,
                            )
                          : ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: Provider.of<OrderProvider>(context)
                                  .order
                                  .items
                                  .length,
                              itemBuilder: (BuildContext context, int index) {
                                return OrderCard(
                                  index: index,
                                );
                              },
                            ),
                ),
                Text(
                  "Total : ₹ ${Provider.of<OrderProvider>(context).order.totalPrice.toString()}",
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
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(primaryColor),
                        ),
                        onPressed: () {
                          if (Provider.of<OrderProvider>(context, listen: false)
                              .order
                              .items
                              .isEmpty) {
                            showToast('Select items to order!');
                            return;
                          }
                          Navigator.pop(context);
                          Provider.of<OrderProvider>(context, listen: false)
                              .placeOrder(
                                  Provider.of<LocalUserProvider>(context,
                                          listen: false)
                                      .localUser
                                      .id,
                                  context);
                          showToast('Ordered!');
                          Provider.of<LocalUserProvider>(context, listen: false)
                              .getLastOrders(context);
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

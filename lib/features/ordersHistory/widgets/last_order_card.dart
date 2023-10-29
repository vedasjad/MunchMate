import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/features/ordersHistory/widgets/last_order_item_card.dart';
import 'package:munchmate/features/ordersHistory/widgets/qr_screen.dart';
import 'package:munchmate/models/order.dart';
import 'package:munchmate/provider/last_order_card_provider.dart';
import 'package:provider/provider.dart';

import '../../../common/constants.dart';
import '../../../provider/localUserProvider.dart';

class LastOrderCard extends StatefulWidget {
  const LastOrderCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<LastOrderCard> createState() => _LastOrderCardState();
}

class _LastOrderCardState extends State<LastOrderCard> {
  late Order order;
  @override
  void didChangeDependencies() {
    order = List.from(Provider.of<LocalUserProvider>(context)
        .localUser
        .lastOrders
        .reversed)[widget.index];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    DateTime orderDateTime =
        DateTime.fromMillisecondsSinceEpoch(order.dateTime);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order #${order.id.replaceAll(Provider.of<LocalUserProvider>(context).localUser.id, "")}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: screenWidth * 0.05,
                          ),
                        ),
                        Text(
                          "( x${order.items.length} ${(order.items.length > 1) ? "Items" : "Item"})",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                        "${weekDaysName[orderDateTime.weekday - 1]}, ${orderDateTime.day} ${monthsName[orderDateTime.month - 1]} ${orderDateTime.year}\n ${(orderDateTime.hour > 12) ? (orderDateTime.hour - 12 < 10) ? '0${orderDateTime.hour - 12}' : orderDateTime.hour - 12 : orderDateTime.hour}:${(orderDateTime.minute < 10) ? '0${orderDateTime.minute}' : orderDateTime.minute} ${(orderDateTime.hour > 12) ? "PM" : "AM"}"),
                    SizedBox(
                      height: screenHeight * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${order.totalPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CircleAvatar(
                  radius: screenWidth * 0.08,
                  backgroundImage: NetworkImage(
                    order.items.last.imageUrl,
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        backgroundColor: backgroundColor,
                        child: QRScreen(
                          order: order,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.qr_code,
                    size: screenWidth * 0.15,
                  ),
                ),
              ),
            ],
          ),
          (Provider.of<LastOrderCardProvider>(context)
                  .expandCardList[widget.index])
              ? Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.02,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: order.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LastOrderItemCard(
                          width: screenWidth,
                          height: screenHeight,
                          itemCount: order.itemCounts[index],
                          item: order.items[index],
                        );
                      },
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

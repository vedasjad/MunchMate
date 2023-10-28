import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/common/constants.dart';
import 'package:munchmate/features/ordersHistory/widgets/last_order_item_card.dart';
import 'package:munchmate/features/ordersHistory/widgets/qr_screen.dart';
import 'package:munchmate/models/order.dart';
import 'package:munchmate/provider/last_order_card_provider.dart';
import 'package:provider/provider.dart';

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
    order = Provider.of<LocalUserProvider>(context)
        .localUser
        .lastOrders[widget.index];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                          "Order #${order.id}",
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
                        "${weekDaysName[order.dateTime.weekday - 1]}, ${order.dateTime.day} ${monthsName[order.dateTime.month - 1]} ${order.dateTime.year}\n ${(order.dateTime.hour > 12) ? (order.dateTime.hour - 12 < 10) ? '0${order.dateTime.hour - 12}' : order.dateTime.hour - 12 : order.dateTime.hour}:${(order.dateTime.minute < 10) ? '0${order.dateTime.minute}' : order.dateTime.minute} ${(order.dateTime.hour > 12) ? "PM" : "AM"}"),
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

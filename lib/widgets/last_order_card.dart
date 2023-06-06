import 'package:flutter/material.dart';
import 'package:munchmate/models/order.dart';
import 'package:munchmate/screens/qr_screen.dart';
import 'package:munchmate/utils/colors.dart';
import 'package:munchmate/utils/constants.dart';
import 'package:munchmate/widgets/last_order_item_card.dart';

class LastOrderCard extends StatefulWidget {
  const LastOrderCard({
    super.key,
    required this.width,
    required this.height,
    required this.expand,
    required this.order,
  });

  final double width;
  final double height;
  final bool expand;
  final Order order;

  @override
  State<LastOrderCard> createState() => _LastOrderCardState();
}

class _LastOrderCardState extends State<LastOrderCard> {
  @override
  Widget build(BuildContext context) {
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
                          "Order #${widget.order.id}",
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: widget.width * 0.05,
                          ),
                        ),
                        Text(
                          "( x${widget.order.items.length} ${(widget.order.items.length > 1) ? "Items" : "Item"})",
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Text(
                        "${weekDaysName[widget.order.dateTime.weekday - 1]}, ${widget.order.dateTime.day} ${monthsName[widget.order.dateTime.month - 1]} ${widget.order.dateTime.year}\n ${(widget.order.dateTime.hour > 12) ? (widget.order.dateTime.hour - 12 < 10) ? '0${widget.order.dateTime.hour - 12}' : widget.order.dateTime.hour - 12 : widget.order.dateTime.hour}:${(widget.order.dateTime.minute < 10) ? '0${widget.order.dateTime.minute}' : widget.order.dateTime.minute} ${(widget.order.dateTime.hour > 12) ? "PM" : "AM"}"),
                    SizedBox(
                      height: widget.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "₹ ${widget.order.totalPrice}",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: widget.width * 0.045,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CircleAvatar(
                  radius: widget.width * 0.08,
                  backgroundImage: NetworkImage(
                    widget.order.items[0].imageUrl,
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
                          order: widget.order,
                        ),
                      ),
                    );
                  },
                  child: Icon(
                    Icons.qr_code,
                    size: widget.width * 0.15,
                  ),
                ),
              ),
            ],
          ),
          (widget.expand)
              ? Column(
                  children: [
                    SizedBox(
                      height: widget.height * 0.02,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: widget.order.items.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LastOrderItemCard(
                          width: widget.width,
                          height: widget.height,
                          itemCount: widget.order.itemCounts[index],
                          item: widget.order.items[index],
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

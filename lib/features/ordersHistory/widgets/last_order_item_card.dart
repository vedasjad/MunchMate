import 'package:flutter/material.dart';
import 'package:munchmate/models/item.dart';

class LastOrderItemCard extends StatelessWidget {
  const LastOrderItemCard({
    super.key,
    required this.width,
    required this.height,
    required this.item,
    required this.itemCount,
  });

  final double width;
  final double height;
  final Item item;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: width * 0.07,
                  backgroundImage: NetworkImage(
                    item.imageUrl,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: width * 0.04,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${item.price}',
                      style: TextStyle(
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      'Qty: $itemCount',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

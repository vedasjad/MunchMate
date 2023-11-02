import 'package:flutter/material.dart';
import 'package:munchmate/models/item.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../common/themes.dart';
import '../../../provider/theme_provider.dart';

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
    final textColor =
        Provider.of<ThemeProvider>(context).themeData == AppThemes.light
            ? AppColors.black
            : AppColors.white.withOpacity(0.8);
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
                    color: textColor,
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
                        color: textColor,
                      ),
                    ),
                    Text(
                      'Qty: $itemCount',
                      style: TextStyle(
                        fontSize: width * 0.04,
                        fontWeight: FontWeight.w900,
                        color: textColor,
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

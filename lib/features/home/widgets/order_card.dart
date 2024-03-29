import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/colors.dart';
import '../../../common/themes.dart';
import '../../../provider/orderProvider.dart';
import '../../../provider/theme_provider.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  TextEditingController countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textColor =
        Provider.of<ThemeProvider>(context).themeData == AppThemes.light
            ? AppColors.black
            : AppColors.white.withOpacity(0.8);
    countController.text = Provider.of<OrderProvider>(context)
        .order
        .itemCounts[widget.index]
        .toString();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              Provider.of<OrderProvider>(context)
                  .order
                  .items[widget.index]
                  .imageUrl,
              fit: BoxFit.fill,
              height: width * 0.15,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    Provider.of<OrderProvider>(context)
                        .order
                        .items[widget.index]
                        .name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.037,
                      color: textColor,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Provider.of<OrderProvider>(context, listen: false)
                              .removeItemFromOrder(Provider.of<OrderProvider>(
                                      context,
                                      listen: false)
                                  .order
                                  .items[widget.index]);
                        },
                        splashRadius: 20,
                        icon: Icon(
                          Icons.remove,
                          color: textColor,
                          size: 20,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: countController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        enableSuggestions: false,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        style: TextStyle(
                          color: textColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          Provider.of<OrderProvider>(context, listen: false)
                              .addItemToOrder(Provider.of<OrderProvider>(
                                      context,
                                      listen: false)
                                  .order
                                  .items[widget.index]);
                        },
                        splashRadius: 20,
                        icon: Icon(
                          Icons.add,
                          color: textColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Text(
                "Rs. ${Provider.of<OrderProvider>(context).order.items[widget.index].price}",
                style: TextStyle(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

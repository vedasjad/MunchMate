import 'package:flutter/material.dart';
import 'package:munchmate/utils/constants.dart';

class OrderCard extends StatefulWidget {
  const OrderCard({
    required this.recalculateTotal,
    required this.index,
    Key? key,
  }) : super(key: key);
  final Function() recalculateTotal;
  final int index;

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  TextEditingController countController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    countController.text = order.itemCounts[widget.index].toString();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              order.items[widget.index].imageUrl,
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
                    order.items[widget.index].name,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: width * 0.037,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (order.itemCounts[widget.index] > 0) {
                              order.itemCounts[widget.index]--;
                              totalAmount -= order.items[widget.index].price;
                              widget.recalculateTotal;
                            }
                          });
                        },
                        splashRadius: 20,
                        icon: const Icon(
                          Icons.remove,
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
                      ),
                    ),
                    Expanded(
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            order.itemCounts[widget.index]++;
                            totalAmount += order.items[widget.index].price;
                            widget.recalculateTotal;
                          });
                        },
                        splashRadius: 20,
                        icon: const Icon(
                          Icons.add,
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
                "Rs. ${order.items[widget.index].price}",
              ),
            ],
          ),
        ),
      ],
    );
  }
}

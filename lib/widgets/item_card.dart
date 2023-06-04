import 'package:flutter/material.dart';
import 'package:munchmate/models/item.dart';
import 'package:munchmate/utils/colors.dart';
import 'package:munchmate/utils/constants.dart';
import 'package:toast/toast.dart';

class ItemCard extends StatefulWidget {
  const ItemCard({
    super.key,
    required this.parentContext,
    required this.item,
    required this.height,
    required this.width,
  });
  final BuildContext parentContext;
  final Item item;
  final double height;
  final double width;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    ToastContext toastContext = ToastContext();
    toastContext.init(context);
    return Column(
      children: [
        Container(
          height: widget.height / 6.3,
          width: widget.width / 2.5,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            color: whiteColor,
            shape: BoxShape.rectangle,
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Image.network(
                  widget.item.imageUrl,
                  height: widget.height / 6.3,
                  width: widget.width / 2.5,
                  fit: BoxFit.cover,
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Colors.grey.withOpacity(0.0),
                        blackColor,
                      ],
                      stops: const [0.25, 1.0],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              (user.favourites.contains(widget.item))
                                  ? {
                                      user.favourites.remove(widget.item),
                                      Toast.show(
                                        '${widget.item.name} removed from Favourites',
                                        backgroundColor:
                                            blackColor.withOpacity(0.8),
                                        backgroundRadius: 15,
                                      ),
                                    }
                                  : {
                                      user.favourites.add(widget.item),
                                      Toast.show(
                                        '${widget.item.name} added to Favourites',
                                        backgroundColor:
                                            blackColor.withOpacity(0.8),
                                        backgroundRadius: 15,
                                      ),
                                    };
                            });
                          },
                          child: Icon(
                            (user.favourites.contains(widget.item))
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: widget.width * 0.05,
                            color: (user.favourites.contains(widget.item))
                                ? Colors.red
                                : whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.item.name,
                                style: TextStyle(
                                  color: whiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: widget.width * 0.037,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          height: widget.width / 10,
          width: widget.width / 2.5,
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: whiteColor,
            // boxShadow: [
            //   BoxShadow(
            //     color: blackColor12,
            //     blurRadius: 5,
            //     spreadRadius: 1,
            //   )
            // ],
            borderRadius: const BorderRadius.only(
              bottomRight: Radius.circular(5),
              bottomLeft: Radius.circular(5),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' ₹ ${widget.item.price}',
                style: TextStyle(
                  color: blackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.width * 0.04,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(secondaryColor),
                  ),
                  onPressed: () {
                    (order.items.contains(widget.item))
                        ? order.itemCounts[order.items.indexOf(widget.item)]++
                        : {
                            order.items.add(widget.item),
                            order.itemCounts.add(1),
                          };
                    Toast.show(
                      '${widget.item.name} added',
                      backgroundColor: blackColor.withOpacity(0.8),
                      backgroundRadius: 15,
                    );
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: widget.width * 0.04,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

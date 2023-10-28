import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/common/utils/utils.dart';
import 'package:munchmate/models/item.dart';
import 'package:provider/provider.dart';
import 'package:toast/toast.dart';

import '../../../provider/localUserProvider.dart';
import '../../../provider/orderProvider.dart';

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
          height: widget.height / 6.5,
          width: widget.width / 2.5,
          margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
          padding: const EdgeInsets.all(0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(5),
              topLeft: Radius.circular(5),
            ),
            color: blackColor,
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
                  height: widget.height / 6.5,
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
                              (Provider.of<LocalUserProvider>(context,
                                          listen: false)
                                      .localUser
                                      .favourites
                                      .contains(widget.item))
                                  ? {
                                      Provider.of<LocalUserProvider>(context,
                                              listen: false)
                                          .localUser
                                          .favourites
                                          .remove(widget.item),
                                      showToast(
                                          '${widget.item.name} removed from Favourites'),
                                    }
                                  : {
                                      Provider.of<LocalUserProvider>(context,
                                              listen: false)
                                          .localUser
                                          .favourites
                                          .add(widget.item),
                                      showToast(
                                          '${widget.item.name} added to Favourites'),
                                    };
                            });
                          },
                          child: Icon(
                            (Provider.of<LocalUserProvider>(context)
                                    .localUser
                                    .favourites
                                    .contains(widget.item))
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded,
                            size: widget.width * 0.05,
                            color: (Provider.of<LocalUserProvider>(context)
                                    .localUser
                                    .favourites
                                    .contains(widget.item))
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
          decoration: const BoxDecoration(
            color: blackColor,
            borderRadius: BorderRadius.only(
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
                  color: whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: widget.width * 0.04,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(secondaryColor),
                  ),
                  onPressed: () {
                    Provider.of<OrderProvider>(context, listen: false)
                        .addItemToOrder(widget.item);
                    showToast('${widget.item.name} added');
                  },
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: widget.width * 0.04,
                      color: blackColor,
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

import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:provider/provider.dart';

import '../../../provider/homeProvider.dart';

class HeaderButton extends StatefulWidget {
  const HeaderButton({
    required this.width,
    required this.title,
    required this.asset,
    Key? key,
  }) : super(key: key);
  final double width;
  final String title;
  final String asset;

  @override
  State<HeaderButton> createState() => _HeaderButtonState();
}

class _HeaderButtonState extends State<HeaderButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: EdgeInsets.fromLTRB(
              widget.width * 0.02, 5, widget.width * 0.02, 5),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ],
            shape: BoxShape.circle,
            color: (Provider.of<HomeProvider>(context).selectedItemType ==
                    widget.title)
                ? primaryColor
                : whiteColor,
          ),
          child: Image.asset(
            widget.asset,
            width: widget.width * 0.075,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: blackColor,
            fontSize: widget.width * 0.034,
          ),
        ),
      ],
    );
  }
}

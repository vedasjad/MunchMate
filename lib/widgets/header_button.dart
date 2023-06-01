import 'package:flutter/material.dart';
import 'package:munchmate/utils/colors.dart';
import 'package:munchmate/utils/constants.dart';

class HeaderButton extends StatefulWidget {
  const HeaderButton({
    required this.width,
    required this.title,
    required this.network,
    Key? key,
  }) : super(key: key);
  final double width;
  final String title;
  final String network;

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
              widget.width * 0.02, 10, widget.width * 0.02, 5),
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
            color: (selectedHeader == widget.title)
                ? primaryColor
                : backgroundColor,
          ),
          child: Image.network(
            widget.network,
            width: widget.width * 0.075,
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: widget.width * 0.034,
          ),
        ),
      ],
    );
  }
}

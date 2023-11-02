import 'package:flutter/material.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/models/order.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../common/themes.dart';
import '../../../provider/theme_provider.dart';

class QRScreen extends StatefulWidget {
  const QRScreen({
    required this.order,
    Key? key,
  }) : super(key: key);

  final Order order;
  @override
  State<QRScreen> createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.5,
      width: width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.4,
                  child: QrImageView(
                    eyeStyle: QrEyeStyle(
                      eyeShape: QrEyeShape.square,
                      color: Provider.of<ThemeProvider>(context).themeData ==
                              AppThemes.light
                          ? AppColors.black
                          : AppColors.white,
                    ),
                    dataModuleStyle: QrDataModuleStyle(
                      dataModuleShape: QrDataModuleShape.square,
                      color: Provider.of<ThemeProvider>(context).themeData ==
                              AppThemes.light
                          ? AppColors.black
                          : AppColors.white,
                    ),
                    data: widget.order.id,
                    version: QrVersions.auto,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "Order ID : ${widget.order.id}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: width * 0.05,
                          color:
                              Provider.of<ThemeProvider>(context).themeData ==
                                      AppThemes.light
                                  ? AppColors.black
                                  : AppColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:munchmate/utils/colors.dart';
import 'package:toast/toast.dart';

showToast(String message) {
  return Toast.show(
    message,
    backgroundColor: blackColor.withOpacity(0.8),
    backgroundRadius: 15,
  );
}

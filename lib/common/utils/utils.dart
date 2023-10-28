import 'package:munchmate/common/colors.dart';
import 'package:toast/toast.dart';

showToast(String message) {
  return Toast.show(
    message,
    duration: 1,
    backgroundColor: AppColors.black.withOpacity(0.8),
    backgroundRadius: 15,
  );
}

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:higher_lower/app/features/sample_feature/controller/game_play_controller.dart';
import 'package:higher_lower/app/widget/test.dart';

class AppUtils {
  static bool isLogout = false;
  static void showSnackBar({required String message, required String title}) {
    Get.snackbar(title, message, snackPosition: SnackPosition.BOTTOM);
  }

  static void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        fontSize: 16.0);
  }

  static showLoaderDialog({String? title}) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
            margin: const EdgeInsets.only(left: 7),
            child: Text(title ?? "Loading"),
          ),
        ],
      ),
    );
    Get.dialog(alert);
  }

  static showSuccessDialog(GamePlayController controller) {
    Dialog alert =  Dialog(
      insetPadding: const EdgeInsets.all(0.0),
      backgroundColor: Colors.white,
      child:  CustomDialogBox(controller),
    );
    Get.dialog(alert);
  }

  static hideAlertDialog() {
   Get.back();
  }
}

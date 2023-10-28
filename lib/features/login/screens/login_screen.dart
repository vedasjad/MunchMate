import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:munchmate/common/colors.dart';
import 'package:munchmate/firebase/auth.dart' as auth;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future signInWithGoogle() async {
    await auth.signInWithGoogle();
  }

  // bool activeConnection = false;
  // Future checkUserConnection() async {
  //   try {
  //     final result = await InternetAddress.lookup('google.com');
  //     if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //       setState(() {
  //         activeConnection = true;
  //       });
  //     }
  //   } on SocketException catch (_) {
  //     setState(() {
  //       activeConnection = false;
  //     });
  //   }
  // }

  @override
  void initState() {
    // checkUserConnection();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'MunchMate',
                    style: TextStyle(
                      fontSize: width * 0.1,
                      fontWeight: FontWeight.bold,
                      color: backgroundColor,
                    ),
                  ),
                  Lottie.asset(
                    "assets/jsons/fast-food.json",
                    width: width * 0.7,
                    height: width * 0.7,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.06,
              width: width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(3)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(backgroundColor),
                ),
                onPressed: () {
                  signInWithGoogle();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Image(
                          image: AssetImage(
                            "assets/images/google.png",
                          ),
                          color: backgroundColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Text(
                        'Login with Google',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:munchmate/features/home/screens/home_screen.dart';
import 'package:munchmate/firebase_options.dart';
import 'package:munchmate/provider/last_order_card_provider.dart';
import 'package:munchmate/provider/localUserProvider.dart';
import 'package:munchmate/provider/menu_provider.dart';
import 'package:munchmate/provider/orderProvider.dart';
import 'package:provider/provider.dart';

import 'features/auth/screens/login_screen.dart';
import 'models/local_user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LocalUserProvider()),
        ChangeNotifierProvider(create: (context) => MenuProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => LastOrderCardProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MunchMate',
        theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.ralewayTextTheme(),
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (FirebaseAuth.instance.currentUser != null) {
                final currentUser = FirebaseAuth.instance.currentUser;
                Provider.of<LocalUserProvider>(context, listen: false)
                    .addLocalUser(
                  LocalUser(
                    id: currentUser!.uid,
                    name: currentUser.displayName!,
                    email: currentUser.email!,
                    photoURL: currentUser.photoURL!,
                    favourites: [],
                    lastOrders: [],
                  ),
                );
                return const HomeScreen();
              }
              return const LoginScreen();
            }
            return const LoginScreen();
          },
        ),
      ),
    );
  }
}

import 'package:airbnb/model/category.dart';
import 'package:airbnb/model/place_model.dart';
import 'package:airbnb/view/login_screen.dart';
import 'package:airbnb/view/main_screen.dart';
import 'package:airbnb/Provider/favorite_provider.dart';  // Import the provider
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart'; // Import Provider package

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(  // Wrap MaterialApp with MultiProvider
      providers: [
        ChangeNotifierProvider(create: (context) => FavoriteProvider()), // Provide FavoriteProvider
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return AppMainScreen();
            }
            return LoginScreen();
          },
        ),
      ),
    );
  }
}




// class UploadDataInFirebase extends StatelessWidget {
//   const UploadDataInFirebase({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             await saveCategoryItems();
//              await savePlacesToFirebase();

//           },
//           child: Text("Upload Data"),
//         ),
//       ),
//     );
//   }
// }
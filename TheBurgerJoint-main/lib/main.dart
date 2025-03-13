import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:theburgerjoint/test/firebase_test.dart';
import 'package:theburgerjoint/views/adminviews/additem.dart';
import 'package:theburgerjoint/views/adminviews/edititem.dart';
import 'package:theburgerjoint/views/customerviews/forgetpass.dart';
import 'package:theburgerjoint/views/splash/splash_screen.dart'; 
import 'package:theburgerjoint/views/auth/login.dart'; 

// Future<void> main() async{
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "", // replace with actual values
      appId: "1:685181626342:web:17375464151275b8c5d827",
      messagingSenderId: "685181626342",
      projectId: "theburgerjoint-100",
      // ... other options as needed
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TheBurgerJoint',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: SplashScreen(),
      // home: MyWidget(),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screl_interview/controller/user_data_api_fetch_provider.dart';
import 'package:screl_interview/view/myhomepage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => UserDataFetchProvider(),
      ),
      // ChangeNotifierProvider(
      //   create: (context) => ProductProvider2(),
      // )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

import 'package:crud_chared_prefrence/home.dart';
import 'package:crud_chared_prefrence/pref_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PrefProvider>(
          create: (_) => PrefProvider(),
          lazy: true,
        ),
      ],
      child: MaterialApp(
        title: 'Flutter SharePreference',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
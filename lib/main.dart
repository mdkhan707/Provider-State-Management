import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/home_screen.dart';
import 'package:state_management_provider/provider/authprovider.dart';
import 'package:state_management_provider/provider/count_provider.dart';
import 'package:state_management_provider/provider/example_one_provider.dart';
import 'package:state_management_provider/provider/favourite.dart';
import 'package:state_management_provider/provider/theme_provider.dart';
import 'package:state_management_provider/screens/Favourite/favourite_screen.dart';
import 'package:state_management_provider/screens/Favourite/login.dart';
import 'package:state_management_provider/screens/Favourite/value_notify_listner.dart';
import 'package:state_management_provider/screens/count.dart';
import 'package:state_management_provider/screens/dark_theme.dart';
import 'package:state_management_provider/screens/example_one.dart';
import 'package:state_management_provider/why_provider.dart' hide Provider;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => FavouritItem()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
          ChangeNotifierProvider(create: (_) => AuthProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themechanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            themeMode: themechanger.thememode,
            theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
                appBarTheme: AppBarTheme(backgroundColor: Colors.teal),
                brightness: Brightness.dark),
            home: LoginScreen(),
          );
        }));
  }
}

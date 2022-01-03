import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/login_page.dart';
import 'package:project/utils/preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'App Dev Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: !Preference.isLoggedIn() ? LoginPage() : HomePage(),
    );
  }
}

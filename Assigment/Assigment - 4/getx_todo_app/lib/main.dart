import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_todo_app/localizations/add_translation.dart';
import 'package:getx_todo_app/screen/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      themeMode: ThemeMode.system,
      locale: const Locale('en'),
      translations: AddTraslation(),
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomePage(),
        ),
      ],
      initialRoute: '/',
      home: const HomePage(),
    );
  }
}

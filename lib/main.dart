import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokedex/main_bindings.dart';
import 'package:pokedex/presentation/navigation/app_pages.dart';
import 'package:pokedex/presentation/navigation/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PokedexApp());
}

class PokedexApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoutes.kAnimationPage,
      initialBinding: MainBindings(),
      getPages: AppPages.pageList,
      defaultTransition: Transition.rightToLeftWithFade,
    );
  }
}

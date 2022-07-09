import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'x_res/my_res.dart';
import 'x_routes/routes.dart';

Future<void> main() async {
  // Step 2
  WidgetsFlutterBinding.ensureInitialized();
  // Step 3
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then((value) => runApp(MyApp()));
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.darktheme(),
      darkTheme: AppThemes.darktheme(),
      themeMode: AppThemes().init(),
      locale: MyTranslations.en,
      fallbackLocale: MyTranslations.vi,
      translations: MyTranslations(),
      initialRoute: RouterName.login,
      debugShowCheckedModeBanner: false,
      getPages: Pages.pages(),
    );
  }
}

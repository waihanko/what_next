import 'package:flutter/services.dart';
import 'package:higher_lower/app/constant/routing/app_pages.dart';
import 'package:higher_lower/app/constant/routing/app_route.dart';
import 'package:higher_lower/app/core/binding/initial_binding.dart';
import 'package:higher_lower/app/core/config/configure_supabase.dart';
import 'package:higher_lower/app/data/local/cache_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/constant/translation/app_translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureSupabase();
  await Get.putAsync<CacheManager>(() async => CacheManager().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Higher-Lower',
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.find<CacheManager>().getLocale(),
      getPages: AppPages.pages,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
            backgroundColor: Colors.yellow,
        ),
      ),
      initialRoute: Routes.signInScreen,
      initialBinding: InitialBinding(),
      themeMode: ThemeMode.dark,
    );
  }
}

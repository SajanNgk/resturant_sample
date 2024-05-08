import 'package:get/get.dart';
import 'package:hyperce/api/db/db_helper.dart';
import 'package:hyperce/config/config.dart';
import 'package:hyperce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hyperce/themes.dart';
import 'binding/app_binding.dart';
import 'services/notification/notification_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  runApp(MyApp());
}
Future<void> initializeApp() async {
  // Initialize notification service.
  NotificationService().initialize();

  // Initialize Hive for local data storage.
  await Hive.initFlutter();
  await initHiveForFlutter();

  // Open Hive boxes for storing data.
  await Hive.openBox<int>(DatabaseHelper.outerlayerDB);
  await Hive.openBox<String>(DatabaseHelper.authTokenDB);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Set preferred screen orientations.
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );

    // Set up GraphQL client with HTTP link and cache using Hive.
    final HttpLink httpLink = HttpLink(AppConfig.baseUrl);
    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        link: httpLink,
        // The default store is the InMemoryStore, which does NOT persist to disk
        cache: GraphQLCache(
          store: HiveStore(),
        ),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (child, Widget) {
          return GetMaterialApp(
            title: AppConfig.appName,
            initialBinding: MyBinding(),
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: TextScaler.linear(1.0)),
                child: widget!,
              );
            },
            home: SplashScreen(),
            debugShowCheckedModeBanner: AppConfig.showDebugBanner,
            theme: RestronautAppTheme.light,
          );
        },
      ),
    );
  }
}

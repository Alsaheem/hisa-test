import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'core/services/navigation_service.dart';
import 'core/viewmodels/theme_provider.dart';
import 'locator.dart';
import 'ui/shared/app_theme.dart';
import 'ui/views/mainview.dart';
import 'ui/router.dart' as router;
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DotEnv.load(fileName: '.env');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.setDarkTheme = themeChangeProvider.darkTheme;
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: allProviders,
      child: Consumer<DarkThemeProvider>(
        builder: (context, appState, child) {
          return MaterialApp(
            title: 'otakuzōn',
            debugShowCheckedModeBanner: false,
            theme:
                appState.darkTheme ? AppTheme.darkTheme : AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.system,
            home: MyHomePage(title: 'Flutter Demo Home Page'),
            onGenerateRoute: router.Router.generateRoute,
            navigatorKey: locator<NavigationService>().navigationKey,
          );
        },
      ),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

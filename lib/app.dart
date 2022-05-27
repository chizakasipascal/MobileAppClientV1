import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobileappclientv1/src/const/routes.dart';
import 'package:mobileappclientv1/src/views/screens/screens.dart';

// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import 'package:flutter_localizations/flutter_localizations.dart';
import 'src/const/app_theme.dart';
import 'src/const/strings.dart';

class EspaceClientAppV1 extends StatelessWidget {
  const EspaceClientAppV1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.top]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // supportedLocales: L10n.all,
      // localizationsDelegates: const [
      //   // AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],

      theme: themeData,
      title: Strings.appName,
      // initialRoute: Routes.initial,
      home: LoginScreen(),
      routes: Routes.routes,
    );
  }
}

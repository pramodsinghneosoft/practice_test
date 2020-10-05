import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_test/bloc_equatable_page/bloc/userbloc_bloc.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_repository.dart';
import 'package:sqflite_test/bloc_equatable_page/pages/user_view.dart';
import 'package:sqflite_test/bloc_pattern/bloc_view.dart';
import 'package:sqflite_test/bloc_pattern/posts_view.dart';
import 'package:sqflite_test/bottom_tabbar/bottom_tab_view.dart';
import 'package:sqflite_test/flappy_searchbar/flappy_search_view.dart';
import 'package:sqflite_test/get_it_files/get_it_view.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';
import 'package:sqflite_test/listview_filter/listview_filter_view.dart';
import 'package:sqflite_test/localizations/application_view.dart';
import 'package:sqflite_test/localizations/apptransaltion_delegate_view.dart';
import 'package:sqflite_test/navigator_service/navigator_service.dart';
import 'package:sqflite_test/no_captcha/nocaptha_view.dart';
import 'package:sqflite_test/provider_files/provider_model.dart';
import 'package:sqflite_test/recaptcha_page/recaptcha_page_view.dart';
import 'package:sqflite_test/speech_to_text_view.dart/speechtotext.dart';
import 'package:sqflite_test/tabbar/tab_bar_view.dart';
import 'package:sqflite_test/wordpress_page/wordpress_page_view.dart';

void main() {
  serviceLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppTranslationDelegate _newLocalDelegate;

  @override
  void initState() {
    _newLocalDelegate = AppTranslationDelegate(newLocale: null);
    Application().onLocalChanged = onLocalChange;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      home: BlocProvider(
        create: (context) => UserblocBloc(UserRepositoryImpl()),
        child: ChangeNotifierProvider(
            create: (context) => ProviderCounterModel(),
            child: RecaptchaPageView()
            // UserDataView()
            // SpeechTextView()
            // WordPressApiView(),
            // FilterListviewView()
            // FlappySearchBarView()
            // BottomTabbarView(),
            // TabbarView(),
            // PostsView()
            // GetItView(),
            // MyHomePage(),
            // LocalizationView(),
            // MyHomePage(),
            // SQFLiteView()
            // ProviderView()
            ),
      ),
      // home: StreamdataView()
      // home:SQFLiteView()
      onGenerateRoute: (routeSettings) {
        switch (routeSettings.name) {
          case 'myhomepage':
            return MaterialPageRoute(builder: (context) => MyHomePage());
          default:
            return MaterialPageRoute(builder: (context) => MyHomePage());
        }
      },

      localizationsDelegates: [
        _newLocalDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale("en", ""),
        const Locale("hi", ""),
        const Locale("pt", ""),
      ],
    );
  }

  void onLocalChange(Locale locale) {
    setState(() {
      _newLocalDelegate = AppTranslationDelegate(newLocale: locale);
    });
  }
}

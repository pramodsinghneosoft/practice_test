import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as riv;
import 'package:provider/provider.dart';
import 'package:sqflite_test/bloc_equatable_page/bloc/userbloc_bloc.dart';
import 'package:sqflite_test/bloc_equatable_page/model/user_repository.dart';
import 'package:sqflite_test/bloc_equatable_page/pages/user_view.dart';
import 'package:sqflite_test/bloc_pattern/bloc_view.dart';
import 'package:sqflite_test/bloc_pattern/posts_view.dart';
import 'package:sqflite_test/bottom_tabbar/bottom_tab_view.dart';
import 'package:sqflite_test/email_validator_page/email_validate_page.dart';
import 'package:sqflite_test/flappy_searchbar/flappy_search_view.dart';
import 'package:sqflite_test/get_it_files/get_it_view.dart';
import 'package:sqflite_test/get_it_files/service_locator_view.dart';
import 'package:sqflite_test/getx_page/view/getx_page_view.dart';
import 'package:sqflite_test/inheritedwidget_page/inheritedwidget_page_view.dart';
import 'package:sqflite_test/inheritedwidget_page/state_container_view.dart';
import 'package:sqflite_test/listview_filter/listview_filter_view.dart';
import 'package:sqflite_test/localizations/application_view.dart';
import 'package:sqflite_test/localizations/apptransaltion_delegate_view.dart';
import 'package:sqflite_test/localize_page/localize_page_view.dart';
import 'package:sqflite_test/navigator_service/navigator_service.dart';
import 'package:sqflite_test/no_captcha/nocaptha_view.dart';
import 'package:sqflite_test/provider_files/provider_counter_view.dart';
import 'package:sqflite_test/provider_files/provider_model.dart';
import 'package:sqflite_test/provider_files/provider_page/provider_model.dart';
import 'package:sqflite_test/provider_files/provider_page/provider_page_view.dart';
import 'package:sqflite_test/rating_bar/rating_bar_page.dart';
import 'package:sqflite_test/recaptcha_page/recaptcha_page_view.dart';
import 'package:sqflite_test/riverpod_page/riverpod_page_view.dart';
import 'package:sqflite_test/riverpod_page/user_data/river_user_model.dart';
import 'package:sqflite_test/sliver_page/sliver_page_example_view.dart';
import 'package:sqflite_test/speech_to_text_view.dart/speechtotext.dart';
import 'package:sqflite_test/streams_files/stream_view.dart';
import 'package:sqflite_test/tabbar/tab_bar_view.dart';
import 'package:sqflite_test/wordpress_page/wordpress_page_view.dart';

import 'riverpod_page/counter_notifier_view.dart';
import 'riverpod_page/user_data/river_user_view.dart';
import 'riverpod_page/user_data/user_api_river.dart';

void main() {
  serviceLocator();
  // runApp(ProviderScope(child: MyApp()));
  // runApp(MyApp());
  runApp(StateContainerView(child: MyApp()));
}

final providerHook = riv.StateNotifierProvider((ref) => CounterNotifier());
final providerUser =
    riv.StateNotifierProvider((ref) => UserFetchData(List<RiverUserModel>()));

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQFLite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: locator<NavigatorService>().navigatorKey,
      // home: RiverUserView(),

      // home: RiverPodPageView(),
      home: BlocProvider(
          create: (context) => UserblocBloc(UserRepositoryImpl()),
          child: MultiProvider(providers: [
            ChangeNotifierProvider<ProviderModel>(
              create: (_) => ProviderModel(),
            ),
            ChangeNotifierProvider<ProviderCounterModel>(
              create: (_) => ProviderCounterModel(),
            )
          ], child: ProviderPageView()
              //  InheritedWidgetPageView(),
              //  RatingBarPage()
              // LocalizaPageView()
              // EmailValidatorPage(),
              // GetXPageView(),
              //  SliverPageView()
              // RecaptchaPageView()
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
              )),
      // home: StreamdataView(),
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
        const Locale("en", "US"),
        const Locale("hi", "IN"),
        const Locale("pt", "PT"),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocaleLanguage in supportedLocales) {
          if (supportedLocaleLanguage.languageCode == locale.languageCode &&
              supportedLocaleLanguage.countryCode == locale.countryCode) {
            return supportedLocaleLanguage;
          }
        }
        return supportedLocales.first;
      },
    );
  }

  void onLocalChange(Locale locale) {
    setState(() {
      _newLocalDelegate = AppTranslationDelegate(newLocale: locale);
    });
  }
}

import 'package:get_it/get_it.dart';
import 'package:sqflite_test/bloc_pattern/bloc_model.dart';
import 'package:sqflite_test/bloc_pattern/network.dart';
import 'package:sqflite_test/bloc_pattern/posts_bloc.dart';
import 'package:sqflite_test/get_it_files/api_service.dart';
import 'package:sqflite_test/get_it_files/network_model.dart';
import 'package:sqflite_test/navigator_service/navigator_service.dart';

GetIt locator = GetIt.instance;

void serviceLocator() {
  locator.registerFactory(() => APIService());

  locator.registerFactory(() => NetworkInfo());

  locator.registerFactory(() => NavigatorService());
  locator.registerFactory(() => CounterBloc());
  locator.registerFactory(() => PostsBloc());
  locator.registerFactory(() => NetworkService());
}

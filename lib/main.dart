import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:india_beats_covid/di/injection.dart';
import 'package:india_beats_covid/pkgs.dart';
import 'package:india_beats_covid/utils/constants.dart';
import 'app/app.dart';
import 'pkgs.dart';
import 'store/store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setOverlay();

  final dio = Dio(BaseOptions(baseUrl: Constants.baseUrl));

  Injector.configure(Flavor.REST, DataMode.JSON, dio, CancelToken());

  runApp(VxState(
    child: App(),
    store: Store(),
  ));
}

void setOverlay() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  //* Forcing only portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

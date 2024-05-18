import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zenmoney/app/config/firebase_options.dart';
import 'package:zenmoney/app/config/remote_config.dart';
import 'package:zenmoney/features/nn.dart';
import 'package:zenmoney/main.dart';

Future<void> initDI() async {
  await AppTrackingTransparency.requestTrackingAuthorization();
  final sharedPreferences = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  final isFirstTime = di<SharedPreferences>().getBool('isFirstTime');
  await di<SharedPreferences>().setBool('isFirstTime', isFirstTime ?? true);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(seconds: 25),
    minimumFetchInterval: const Duration(seconds: 25),
  ));
  await remoteConfig.fetchAndActivate();
  final remoteConfigService = RemoteConfig(remoteConfig);
  await NotificationsActivation().activate();
  await getTracking();
  await afGazel();
  di.registerSingleton<RemoteConfig>(remoteConfigService);
}

Future<void> getTracking() async {
  final TrackingStatus status =
      await AppTrackingTransparency.requestTrackingAuthorization();
  print(status);
}

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfig {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfig(this._remoteConfig);

  String? get privacyPolicy => _remoteConfig.getString("privacy_policy");
  String? get termsOfUse => _remoteConfig.getString("terms_of_use");
  String? get subscription => _remoteConfig.getString("subscription");
  String? get support => _remoteConfig.getString("support");
  String? get promotion => _remoteConfig.getString("promotion");
}

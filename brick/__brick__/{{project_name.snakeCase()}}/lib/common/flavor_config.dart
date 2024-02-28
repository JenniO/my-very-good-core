import 'package:{{project_name.snakeCase()}}/common/constants.dart';

enum Flavor {
  development,
  staging,
  production,
}

enum Server { test, staging, live }

extension ParseToString on Flavor {
  String toShortString() {
    switch (this) {
      case Flavor.development:
        return 'DEV';
      case Flavor.staging:
        return 'STG';
      case Flavor.production:
        return 'PROD';
    }
  }
}

class FlavorConfig {
  static Flavor appFlavor = Flavor.production;
  static Server server = Server.live;

  static String googleOAuthClientId = '';

  static String get baseUrl {
    switch (server) {
      case Server.live:
        return Constants.baseUrlProd;
      case Server.staging:
        return Constants.baseUrlStaging;
      case Server.test:
        return Constants.baseUrlTest;
    }
  }
}

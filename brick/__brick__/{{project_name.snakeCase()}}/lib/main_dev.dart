import 'package:{{project_name.snakeCase()}}/common/flavor_config.dart';
import 'package:{{project_name.snakeCase()}}/main_common.dart';

void main() {
  FlavorConfig.appFlavor = Flavor.development;
  FlavorConfig.server = Server.test;
  mainCommon();
}

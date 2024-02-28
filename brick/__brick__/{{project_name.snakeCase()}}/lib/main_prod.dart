import 'package:{{project_name.snakeCase()}}/common/flavor_config.dart';
import 'package:{{project_name.snakeCase()}}/main_common.dart';

void main() {
  FlavorConfig.appFlavor = Flavor.production;
  FlavorConfig.server = Server.live;
  mainCommon();
}

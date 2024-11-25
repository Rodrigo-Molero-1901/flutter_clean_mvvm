import 'package:injectable/injectable.dart';

import '../network/api/api_client.dart';

@module
abstract class AppModuleInjection {
  @lazySingleton
  ApiClient get apiClient => ApiClient.init();
}

// ignore_for_file: invalid_annotation_target

import 'package:injectable/injectable.dart';

import '../network/api/api_client.dart';
import '../network/api/local_api_client.dart';

@module
abstract class AppModuleInjection {
  @lazySingleton
  ApiClient get apiClient => ApiClient.init();

  @preResolve
  Future<LocalApiClient> get localApiClient async => await LocalApiClient.init();
}

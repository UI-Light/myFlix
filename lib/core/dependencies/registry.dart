import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';

//
void registerdependencies({String baseUrl = ''}) {
  final apiClient = ApiClient(baseUrl: baseUrl);

  GetIt.I.registerLazySingleton<ApiClient>(() => apiClient);
}

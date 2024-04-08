import 'package:get_it/get_it.dart';
import 'package:myflix/core/data/api_client.dart';
import 'package:myflix/features/home/data/home_repository.dart';

//
void registerdependencies({String baseUrl = '', String token = ''}) {
  final apiClient = ApiClient(baseUrl: baseUrl, token: token);

  GetIt.I.registerLazySingleton<ApiClient>(() => apiClient);

  GetIt.I.registerLazySingleton<HomeRepository>(
    () => HomeRepository(client: apiClient),
  );
}

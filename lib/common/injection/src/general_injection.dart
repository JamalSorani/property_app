// 📦 Package imports:
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 🌎 Project imports:
import '../../../app/auth/infrastructure/data_source/local/reactive_token_storage.dart';
import '../../../app/auth/presentation/state/provider/counter_provider.dart';
import '../../constant/src/url.dart';
import '../../network/dio_client.dart';
import '../../utils/storage_service/storage_service.dart';
import '../injection.dart';

Future<void> generalInjection() async {
  // Register SharedPreferences for lightweight local storage
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  getIt.registerLazySingleton<CountdownProvider>(() => CountdownProvider());

  // Register a shared storage service wrapper for SharedPreferences
  getIt.registerSingleton<StorageService<SharedStorage>>(
    StorageService.shared(
      getIt<
          SharedPreferences>(), // Inject SharedPreferences into the storage service
    ),
  );

  // Android-specific options for FlutterSecureStorage (enabling encrypted shared preferences)
  AndroidOptions getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );

  // iOS-specific options for FlutterSecureStorage (setting keychain accessibility)
  const iOptions =
      IOSOptions(accessibility: KeychainAccessibility.first_unlock);

  // Register FlutterSecureStorage for storing sensitive data securely
  getIt.registerSingleton<FlutterSecureStorage>(
    FlutterSecureStorage(
      aOptions: getAndroidOptions(), // Apply Android options
      iOptions: iOptions, // Apply iOS options
    ),
  );

  // Register a secure storage service wrapper for FlutterSecureStorage
  getIt.registerSingleton<StorageService<SecureStorage>>(
    StorageService.secure(
      getIt<
          FlutterSecureStorage>(), // Inject FlutterSecureStorage into the storage service
    ),
  );

  // Register a ReactiveTokenStorage for managing authentication tokens
  getIt.registerSingleton<ReactiveTokenStorage>(
    ReactiveTokenStorage(getIt<
        StorageService<SecureStorage>>()), // Inject secure storage service
  );

  // Load the token into memory at application startup
  getIt<ReactiveTokenStorage>().loadToken();

  // Register a configured Dio HTTP client with a base URL
  getIt.registerSingleton<Dio>(
    DioClient(
        "${AppUrl.baseUrlDevelopment}api/"), // Set the base URL for API calls
  );
}

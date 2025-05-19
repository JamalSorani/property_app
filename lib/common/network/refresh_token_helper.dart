// 📦 Package imports:
import 'package:jwt_decoder/jwt_decoder.dart';

// 🌎 Project imports:
import '../../app/auth/infrastructure/data_source/local/auth_local.dart';
import '../../core/user/entities/user.dart';
import '../helper/colored_print.dart';
import '../injection/injection.dart';

bool isTokenAboutToExpire(String token, {int bufferTimeInSeconds = 900}) {
  try {
    // Decode the token
    DateTime expirationDate = JwtDecoder.getExpirationDate(token);
    printK("expirationDate:     $expirationDate");

    // Get the current time
    DateTime now = DateTime.now();
    printK("currentTime:     $now");

    // Add buffer time (default: 15 minutes)
    DateTime bufferTime =
        expirationDate.subtract(Duration(seconds: bufferTimeInSeconds));
    printK("bufferTime:     $bufferTime");

    // Check if the token is about to expire
    bool shouldRefresh = now.isAfter(bufferTime);
    return shouldRefresh;
  } catch (e) {
    // Handle invalid token
    printR('Error decoding token: $e');
    return true; // Treat invalid token as expired
  }
}

Future<void> updateStorageToken(
  User user,
  String accessToken,
) async {
  User user2 = User(
    id: user.id,
    accessToken: accessToken,
    refreshToken: user.refreshToken,
    fullName: user.fullName,
  );
  await getIt<AuthLocal>().setUser(user2);
}

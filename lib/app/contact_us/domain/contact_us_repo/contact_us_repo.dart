// 📦 Package imports:
import 'package:either_dart/either.dart';

abstract class ContactUsRepo {
  Future<Either<String, bool>> contactPost(String title, String body);
}

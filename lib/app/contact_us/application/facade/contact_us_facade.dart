// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/contact_us/domain/contact_us_repo/contact_us_repo.dart';

class ContactUsFacade {
  final ContactUsRepo _remote;
  ContactUsFacade({
    required ContactUsRepo remote,
  }) : _remote = remote;

  Future<Either<String, bool>> contactUs(String title, String body) =>
      _remote.contactPost(title, body);
}

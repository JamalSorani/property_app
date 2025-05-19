// ignore_for_file: public_member_api_docs, sort_constructors_first

// 📦 Package imports:
import 'package:either_dart/either.dart';

// 🌎 Project imports:
import 'package:template_app/app/contact_us/domain/contact_us_repo/contact_us_repo.dart';
import 'package:template_app/app/contact_us/infrastructure/datasource/remote/contact_us_remote.dart';
import 'package:template_app/common/network/exception/error_handler.dart';

class ContactUsRepoImpl extends ContactUsRepo {
  final ContactUsRemote _remote;
  ContactUsRepoImpl({
    required ContactUsRemote remote,
  }) : _remote = remote;

  @override
  Future<Either<String, bool>> contactPost(String title, String body) async {
    return throwAppException(() async {
      final result = await _remote.contactPost(title, body);
      return result;
    });
  }
}

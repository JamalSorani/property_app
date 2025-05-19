// 🌎 Project imports:
import 'package:easy_localization/easy_localization.dart';

import 'app/app.dart';
import 'bootstrap.dart';
import 'common/imports/imports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  bootstrap(
    EasyLocalization(
      supportedLocales: const [
        Locale('ar'),
      ],
      path: 'assets/l10n',
      fallbackLocale: const Locale('ar'),
      child: const MyApp(),
    ),
  );
}

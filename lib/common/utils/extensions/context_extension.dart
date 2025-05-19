// 🌎 Project imports:

import 'package:easy_localization/easy_localization.dart';

import '../../config/theme.dart';
import '../../imports/imports.dart';

extension Context on BuildContext {
  double _getWidth() {
    return MediaQuery.of(this).size.width;
  }

  double _getHeight() {
    return MediaQuery.of(this).size.height;
  }

  TextTheme _getStyle() {
    return AppThemes.textTheme;
  }

  String _route() {
    final uri = currentBeamLocation.state.routeInformation.uri;
    return uri.toString();
  }

  bool _isEnglish() {
    return locale == const Locale("en", 'US');
  }

  String get route => _route();

  double get screenWidth => _getWidth();

  double get screenHeight => _getHeight();

  TextTheme get textTheme => _getStyle();

  bool get isEnglish => _isEnglish();

  bool get isSmallDevice {
    return screenHeight <= 650;
  }

  bool get isTab {
    return screenHeight >= 1250;
  }
}

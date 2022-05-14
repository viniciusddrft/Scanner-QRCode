import 'package:flutter/material.dart';

import '../../src/modules/createqrcode/create_qr_code/view/create_qrcode_view.dart';
import '../../src/modules/createqrcode/create_qr_code_result/create_qrcode_result_view.dart';
import '../../src/modules/help/help_view/help_view.dart';
import '../../src/modules/help/solution_view/solution_view.dart';
import '../../src/modules/page_view/view/my_page_view.dart';
import '../../src/modules/readqrcode/result_read_code/resultreadcode_view.dart';
import '../../src/modules/readqrcode/scanner_view/scanner_camera_view.dart';
import '../../src/modules/settings/settings_qrcode/settings_qrcode_page.dart';
import 'animations/animated_page_rout_builder_elastic_out.dart';
import 'animations/animated_page_rout_builder_left_to_right.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/PageView':
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyPageView(),
        );
      case '/ScannerCamera':
        return MaterialPageRoute(
          builder: (BuildContext context) => ScannerCameraView(
            cameras: (settings.arguments as Map<String, dynamic>)['cameras'],
          ),
        );
      case '/SettingsQRCode':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: const SettingsQRCodePage(),
        );
      case '/Help':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: const HelpView(),
        );
      case '/Solution':
        return AnimatedPageRouteBuilderLeftToRight(
          duration: const Duration(milliseconds: 300),
          route: SolutionView(
            problem: (settings.arguments as Map<String, String>)['problem']!,
            solution: (settings.arguments as Map<String, String>)['solution']!,
          ),
        );
      case '/CreateQRCode':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: CreateQRCodeView(
              typeQRCode:
                  (settings.arguments as Map<String, String>)['typeQRCode']!),
        );
      case '/CreateQRCodeResult':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: CreateQRCodeResult(
              dataQRCode:
                  (settings.arguments as Map<String, String>)['dataQRCode']!),
        );
      case '/ReadQRCodeResult':
        return AnimatedPageRouteBuilderElasticOut(
          duration: const Duration(milliseconds: 500),
          route: ResultReadCode(
            result: (settings.arguments as Map<String, dynamic>)['result'],
            typeCode: (settings.arguments as Map<String, dynamic>)['typeCode'],
          ),
        );
    }
    return null;
  }
}

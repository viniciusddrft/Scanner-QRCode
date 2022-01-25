import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code/create_qrcode_view.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code_result/create_qrcode_result_view.dart';
import 'package:scannerqrcode/src/modules/help/help_view.dart';
import 'package:scannerqrcode/src/modules/help/solution_view.dart';
import 'package:scannerqrcode/src/modules/home/view/home_page.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/result_read_code/resultreadcode_view.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/scanner_view/scanner_camera_view.dart';
import 'package:scannerqrcode/core/routes/animations/animated_page_rout_builder_elastic_out.dart';
import 'package:scannerqrcode/core/routes/animations/animated_page_rout_builder_left_to_right.dart';

class Routes {
  static Route<dynamic>? routes(RouteSettings settings) {
    switch (settings.name) {
      case '/Home':
        return MaterialPageRoute(
          builder: (BuildContext context) => const MyHomePage(),
        );
      case '/ScannerCamera':
        return MaterialPageRoute(
          builder: (BuildContext context) => ScannerCameraView(
            cameras: (settings.arguments as Map<String, dynamic>)['cameras'],
          ),
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
  }
}

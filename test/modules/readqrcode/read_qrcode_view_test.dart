import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/readqrcode/result_read_code/resultreadcode_view.dart';
import 'package:scannerqrcode/src/modules/readqrcode/scanner_view/components/overlay_barcode/overlay_camera_barcode_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/scanner_view/components/overlay_qrcode/overlay_camera_qrcode_widget.dart';
import 'package:scannerqrcode/src/modules/readqrcode/scanner_view/scanner_camera_view.dart';
import 'package:scannerqrcode/src/shared/admob/widget/native_ad.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  group('Read qrcode view -> ', () {
    testWidgets('scanner test 5 buttons and function change mode',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ThemeApp(
            notifier: ThemeAppNotifier(),
            child: LocaleApp(
              notifier: LocaleAppNotifier(),
              child: SettingsQRCodeApp(
                notifier: SettingsQRCodeNotifier(),
                child: const ScannerCameraView(cameras: [
                  CameraDescription(
                      name: 'camera',
                      lensDirection: CameraLensDirection.back,
                      sensorOrientation: 1)
                ]),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(FloatingActionButton), findsNWidgets(5));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();
      expect(find.byType(OverlayCameraQrcodeWidget), findsOneWidget);

      await tester.tap(find.byIcon(FontAwesomeIcons.barcode));

      await tester.pump();

      expect(find.byType(OlverlayCameraBarcodeWidget), findsOneWidget);
    });

    testWidgets('Read qrcode result view', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ThemeApp(
            notifier: ThemeAppNotifier(),
            child: LocaleApp(
              notifier: LocaleAppNotifier(),
              child: SettingsQRCodeApp(
                notifier: SettingsQRCodeNotifier(),
                child: const ResultReadCode(
                    result: 'teste', typeCode: BarcodeType.text),
              ),
            ),
          ),
        ),
      );

      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(Text), findsNWidgets(4));
      expect(find.byType(AdmobNativeAd), findsOneWidget);
    });
  });
}

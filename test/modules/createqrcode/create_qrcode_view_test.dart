import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code/view/create_qrcode_view.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code_result/create_qrcode_result_view.dart';
import 'package:scannerqrcode/src/shared/admob/widget/native_ad.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  group('Create qrcode view -> ', () {
    testWidgets('show ad and creation qrcode ', (WidgetTester tester) async {
      final List<String> types = [
        'text',
        'wifi',
        'link',
        'contact',
        'whatsapp',
        'instagram',
        'facebook',
        'onlyfans',
        'privacy',
        'youtube',
        'tiktok',
        'twitter',
        'github',
        'twitch',
        'reddit'
      ];
      for (String type in types) {
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
                  child: CreateQRCodeView(typeQRCode: type),
                ),
              ),
            ),
          ),
        );
        expect(find.byType(AppBar), findsOneWidget);
        expect(find.byType(TextFormField), findsWidgets);
        expect(find.byType(AdmobNativeAd), findsOneWidget);
      }
    });
    testWidgets('show result qrcode ', (WidgetTester tester) async {
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
                child: const CreateQRCodeResult(dataQRCode: 'teste'),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(QrImageView), findsOneWidget);
      expect(find.byType(AdmobNativeAd), findsOneWidget);
    });
  });
}

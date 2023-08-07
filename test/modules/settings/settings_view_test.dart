import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/settings/settings_qrcode/components/button_switch_color.dart';
import 'package:scannerqrcode/src/modules/settings/settings_qrcode/components/button_switch_logo.dart';
import 'package:scannerqrcode/src/modules/settings/settings_qrcode/components/button_switch_shape.dart';
import 'package:scannerqrcode/src/modules/settings/settings_qrcode/components/qr_code_example.dart';
import 'package:scannerqrcode/src/modules/settings/settings_qrcode/settings_qrcode_page.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  group('Settings view test -> ', () {
    testWidgets('settings qrcode', (WidgetTester tester) async {
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
                child: const SettingsQRCodePage(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(ButtonSwitchColor), findsNWidgets(3));
      expect(find.byType(ButtonSwitchShape), findsNWidgets(2));
      expect(find.byType(ButtonSwitchLogo), findsOneWidget);
      expect(find.byType(QRCodeExample), findsOneWidget);
    });

    testWidgets('settings qrcode button change logo',
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
                child: const SettingsQRCodePage(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(ButtonSwitchColor), findsNWidgets(3));
      expect(find.byType(ButtonSwitchShape), findsNWidgets(2));
      expect(find.byType(ButtonSwitchLogo), findsOneWidget);
      expect(find.byType(QRCodeExample), findsOneWidget);

      await tester.tap(find.byType(ButtonSwitchLogo));

      await tester.pump();
      expect(find.byKey(const Key('popup change logo')), findsOneWidget);
    });

    testWidgets('settings qrcode button change color',
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
                child: const SettingsQRCodePage(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(ButtonSwitchColor), findsNWidgets(3));
      expect(find.byType(ButtonSwitchShape), findsNWidgets(2));
      expect(find.byType(ButtonSwitchLogo), findsOneWidget);
      expect(find.byType(QRCodeExample), findsOneWidget);

      await tester.tap(find.byType(ButtonSwitchColor).first);

      await tester.pump();
      expect(find.byKey(const Key('popup change color')), findsOneWidget);
    });
  });
}

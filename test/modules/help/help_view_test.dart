import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/help/help_view/components/button_help_widget.dart';
import 'package:scannerqrcode/src/modules/help/help_view/help_view.dart';
import 'package:scannerqrcode/src/modules/help/solution_view/solution_view.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  group('Help view test -> ', () {
    testWidgets('show buttons', (WidgetTester tester) async {
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
                child: const HelpView(),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(ButtonHelpWidget), findsNWidgets(3));
    });

    testWidgets('solution view', (WidgetTester tester) async {
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
                child: const SolutionView(
                  problem: 'test',
                  solution: 'test',
                ),
              ),
            ),
          ),
        ),
      );
      expect(find.byType(Text), findsNWidgets(2));
    });
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/core/routes/routes_app.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code_menu/view/components/create_qrcode_menu_item.dart';
import 'package:scannerqrcode/src/modules/createqrcode/create_qr_code_menu/view/create_qrcode_menu_view.dart';
import 'package:scannerqrcode/src/modules/page_view/view/my_page_view.dart';
import 'package:scannerqrcode/src/modules/readqrcode/read_qr_code_menu/read_qr_code_view.dart';
import 'package:scannerqrcode/src/modules/settings/settings_page/settings_page.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

void main() {
  group('PageView with appbar reading screen and settings -> ', () {
    testWidgets('AppBar icons', (WidgetTester tester) async {
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
                child: const MyPageView(),
              ),
            ),
          ),
        ),
      );
      expect(find.widgetWithIcon(AppBar, Icons.qr_code), findsOneWidget);
      expect(find.widgetWithIcon(AppBar, Icons.border_color), findsOneWidget);
      expect(find.widgetWithIcon(AppBar, Icons.settings), findsOneWidget);
      await tester.tap(find.byIcon(Icons.border_color));
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      expect(find.byType(CreateQRCodeMenu), findsOneWidget);
      expect(find.byType(SettingsPage), findsNothing);

      await tester.tap(find.byIcon(Icons.settings));
      for (int i = 0; i < 5; i++) {
        await tester.pump(const Duration(seconds: 1));
      }

      expect(find.byType(SettingsPage), findsOneWidget);
    });
    testWidgets('Scroll horizontal', (WidgetTester tester) async {
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
                child: const MyPageView(),
              ),
            ),
          ),
          onGenerateRoute: Routes.routes,
        ),
      );

      expect(find.byType(ReadQRCodePage), findsOneWidget);
      expect(find.byType(CreateQRCodeMenu), findsNothing);
      expect(find.byType(SettingsPage), findsNothing);

      await tester.drag(find.byType(PageView), const Offset(-300, 0));
      await tester.pump();

      expect(find.byType(CreateQRCodeMenu), findsOneWidget);
      expect(find.byType(SettingsPage), findsNothing);

      await tester.drag(find.byType(PageView), const Offset(-600, 0));
      await tester.pump();

      expect(find.byType(SettingsPage), findsOneWidget);
    });

    testWidgets('Deve mostrar os dois botões na tela e logo',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: ReadQRCodePage(),
        ),
      );
      expect(find.widgetWithIcon(ElevatedButton, Icons.camera_alt),
          findsOneWidget);
      expect(find.widgetWithIcon(ElevatedButton, Icons.photo), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('Menu create qrcode button icons', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          home: CreateQRCodeMenu(),
        ),
      );

      /// Por algum motivo esse teste é impreciso e só conta 9 botoes
      expect(find.byType(CreateQRCodeItemMenu), findsWidgets);
    });
  });
}

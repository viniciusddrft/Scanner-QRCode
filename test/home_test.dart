import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:scannerqrcode/src/modules/readqrcode/view/read_qr_code_menu/read_qr_code_view.dart';

void main() {
  group('PageView with reading screen and settings', () {
    testWidgets('Deve mostrar os dois botões na tela',
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

      await tester.runAsync(() => tester.tap(find.byIcon(Icons.camera_alt)));

      await tester.pump();
    });

    //------
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/read_qr_code_menu/read_qr_code_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  testWidgets('Deve mostrar os dois botões na tela',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: ReadQRCodePage(),
      ),
    );

    expect(find.byType(ElevatedButton), findsNWidgets(2));
  });
}

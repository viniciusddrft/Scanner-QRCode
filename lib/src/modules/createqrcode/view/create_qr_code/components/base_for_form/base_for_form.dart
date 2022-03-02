import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final formkey = GlobalKey<FormState>();

abstract class BaseForm extends StatefulWidget {
  const BaseForm({Key? key}) : super(key: key);

  GlobalKey<FormState> get getKey => formkey;

  void _onPressed(
      {required BuildContext context, required String Function() filter}) {
    final _isValid = formkey.currentState!.validate();
    if (_isValid) {
      Navigator.pushReplacementNamed(context, '/CreateQRCodeResult',
          arguments: <String, String>{
            'dataQRCode': filter(),
          });
    }
  }

  Widget makeButtoncreateQRCode(
      {required BuildContext context, required String Function() filter}) {
    final Size _size = MediaQuery.of(context).size;
    return SizedBox(
      height: _size.height * 0.045,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () => _onPressed(context: context, filter: filter),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              AppLocalizations.of(context)!.createQRCodeALLButton,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Icon(
              Icons.qr_code_2,
              size: 24,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/help/components/button_help_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HelpView extends StatelessWidget {
  const HelpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settingsFrequentProblems),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ButtonHelpWidget(
              problem: AppLocalizations.of(context)!.helpProblem1,
              solution: AppLocalizations.of(context)!.helpSolution1,
            ),
            ButtonHelpWidget(
              problem: AppLocalizations.of(context)!.helpProblem2,
              solution: AppLocalizations.of(context)!.helpSolution2,
            ),
            ButtonHelpWidget(
              problem: AppLocalizations.of(context)!.helpProblem3,
              solution: AppLocalizations.of(context)!.helpSolution3,
            )
          ],
        ),
      ),
    );
  }
}

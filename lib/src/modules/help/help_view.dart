import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/help/components/button_help_widget.dart';
import 'package:easy_localization/easy_localization.dart';

class HelpView extends StatelessWidget {
  const HelpView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff202020),
        title: Text('settingsFrequentProblems'.tr()),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ButtonHelpWidget(
              problem: 'helpProblem1'.tr(),
              solution: 'helpSolution1'.tr(),
            ),
            ButtonHelpWidget(
              problem: 'helpProblem2'.tr(),
              solution: 'helpSolution2'.tr(),
            ),
            ButtonHelpWidget(
              problem: 'helpProblem3'.tr(),
              solution: 'helpSolution3'.tr(),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../../core/locale/locale.dart';

class ButtonSwitchLanguage extends StatefulWidget {
  const ButtonSwitchLanguage({super.key});

  @override
  State<ButtonSwitchLanguage> createState() => _ButtonSwitchLanguageState();
}

class _ButtonSwitchLanguageState extends State<ButtonSwitchLanguage> {
  late final Size size = MediaQuery.of(context).size;

  final ValueNotifier<String?> _iconPath = ValueNotifier<String?>(null);

  List<Map<String, Object>> _allLocales(context) => [
        {
          'text': AppLocalizations.of(context)!.settingsLanguageNameBrasil,
          'icon': 'assets/icons_translations/brazil.png',
          'locale': const Locale('pt', 'BR')
        },
        {
          'text':
              AppLocalizations.of(context)!.settingsLanguageNameUnitedStates,
          'icon': 'assets/icons_translations/unitedstates.png',
          'locale': const Locale('en', 'US')
        },
        {
          'text': AppLocalizations.of(context)!.settingsLanguageNameChina,
          'icon': 'assets/icons_translations/china.png',
          'locale': const Locale('zh', 'CN'),
        },
      ];

  List<Map<String, Object>> get allLocales => _allLocales(context);

  void _popupLanguageMenu(Size size) => showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.settingsLanguagePopup,
            style: Theme.of(context).textTheme.labelLarge,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context)!.settingsPopupButtonCancel,
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            width: size.width * 0.75,
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 20),
              itemCount: allLocales.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 35),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  onPressed: () {
                    _iconPath.value = allLocales[index]['icon'] as String;
                    LocaleApp.locale.value =
                        allLocales[index]['locale'] as Locale;
                    SharedPreferences.getInstance().then(
                      (value) => value.setString(
                        'locale',
                        allLocales[index]['locale'].toString(),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 45,
                    color: Colors.transparent, //para ter hit box no row inteira
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          allLocales[index]['text'] as String,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Image.asset(
                          allLocales[index]['icon'] as String,
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

  @override
  void initState() {
    if (LocaleApp.locale.value == const Locale('pt', 'BR')) {
      _iconPath.value = 'assets/icons_translations/brazil.png';
    } else if (LocaleApp.locale.value == const Locale('en', 'US')) {
      _iconPath.value = 'assets/icons_translations/unitedstates.png';
    } else if (LocaleApp.locale.value == const Locale('zh', 'CN')) {
      _iconPath.value = 'assets/icons_translations/china.png';
    }
    super.initState();
  }

  @override
  void dispose() {
    _iconPath.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: () => _popupLanguageMenu(size),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: ValueListenableBuilder(
                  valueListenable: _iconPath,
                  builder:
                      (BuildContext context, String? value, Widget? child) =>
                          Image.asset(value!, height: 18),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                  AppLocalizations.of(context)!.settingsLanguageTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

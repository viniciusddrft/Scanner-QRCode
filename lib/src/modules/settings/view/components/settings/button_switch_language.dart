import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/locale/locale.dart';

class ButtonSwitchLanguage extends StatefulWidget {
  const ButtonSwitchLanguage({Key? key}) : super(key: key);

  @override
  State<ButtonSwitchLanguage> createState() => _ButtonSwitchLanguageState();
}

class _ButtonSwitchLanguageState extends State<ButtonSwitchLanguage> {
  final ValueNotifier<String?> _iconPath = ValueNotifier<String?>(null);

  List<Map<String, dynamic>> _allLocales(context) => [
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

  List<Map<String, dynamic>> get allLocales => _allLocales(context);

  void _popupLanguageMenu() {
    final Size _size = MediaQuery.of(context).size;

    showDialog<void>(
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
          width: _size.width * 0.75,
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 20),
            itemCount: allLocales.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: const BorderSide(color: Colors.transparent, width: 2),
                ),
                onPressed: () {
                  _iconPath.value = allLocales[index]['icon'];
                  LocaleApp.localeApp.value = allLocales[index]['locale'];
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
                        allLocales[index]['text'],
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      Image.asset(
                        allLocales[index]['icon'],
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
  }

  @override
  void initState() {
    if (LocaleApp.localeApp.value == const Locale('pt', 'BR')) {
      _iconPath.value = 'assets/icons_translations/brazil.png';
    } else if (LocaleApp.localeApp.value == const Locale('en', 'US')) {
      _iconPath.value = 'assets/icons_translations/unitedstates.png';
    } else if (LocaleApp.localeApp.value == const Locale('zh', 'CN')) {
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
    final Size _size = MediaQuery.of(context).size;

    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: Theme.of(context).backgroundColor,
        ),
        onPressed: _popupLanguageMenu,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
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

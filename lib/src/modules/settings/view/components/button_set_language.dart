import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/locale/locale.dart';
import 'package:scannerqrcode/src/shared/themes/text_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonSetLanguage extends StatefulWidget {
  const ButtonSetLanguage({Key? key}) : super(key: key);

  @override
  State<ButtonSetLanguage> createState() => _ButtonSetLanguageState();
}

class _ButtonSetLanguageState extends State<ButtonSetLanguage> {
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

  @override
  void initState() {
    AppTextThemes().addListener(() => setState(() {}));
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

  void _popupLanguageMenu() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.settingsLanguagePopup,
          style: AppTextThemes.titlePopupSettings,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                Text(AppLocalizations.of(context)!.settingsPopupButtonCancel),
          )
        ],
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1.5,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20.h),
            itemCount: allLocales.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  side: BorderSide(color: Colors.black, width: 2.w),
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
                  height: 45.h,
                  color: Colors.transparent, //para ter hit box no row inteira
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        allLocales[index]['text'],
                        style: AppTextThemes.buttonsPopupSettings,
                      ),
                      Image.asset(
                        allLocales[index]['icon'],
                        height: 30.h,
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
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          onPressed: _popupLanguageMenu,
          style: OutlinedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            side: BorderSide(color: Colors.black, width: 2.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  AppLocalizations.of(context)!.settingsLanguageTitle,
                  style: AppTextThemes.buttonsSettings,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: ValueListenableBuilder(
                  valueListenable: _iconPath,
                  builder:
                      (BuildContext context, String? value, Widget? child) =>
                          Image.asset(value!, height: 26.h),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

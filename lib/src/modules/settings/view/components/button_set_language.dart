import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonSetLanguage extends StatefulWidget {
  final Locale locale;
  const ButtonSetLanguage({required this.locale});

  @override
  State<ButtonSetLanguage> createState() => _ButtonSetLanguageState();
}

class _ButtonSetLanguageState extends State<ButtonSetLanguage> {
  late String _iconPath;
  final List<Map<String, dynamic>> _allLocales = [
    {
      'text': 'settingsLanguageNameBrasil'.tr(),
      'icon': 'assets/icons_translations/brazil.png',
      'locale': const Locale('pt', 'BR')
    },
    {
      'text': 'settingsLanguageNameUnitedStates'.tr(),
      'icon': 'assets/icons_translations/unitedstates.png',
      'locale': const Locale('en', 'US')
    },
    {
      'text': 'settingsLanguageNameChina'.tr(),
      'icon': 'assets/icons_translations/china.png',
      'locale': const Locale('zh', 'CN'),
    },
  ];

  @override
  void initState() {
    if (widget.locale == const Locale('pt', 'BR'))
      _iconPath = 'assets/icons_translations/brazil.png';
    else if (widget.locale == const Locale('en', 'US'))
      _iconPath = 'assets/icons_translations/unitedstates.png';
    else if (widget.locale == const Locale('zh', 'CN'))
      _iconPath = 'assets/icons_translations/china.png';
    super.initState();
  }

  void _noticeAndChangeLanguage(
      {required Locale locale, required String icon}) {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            child: Text('settingsPopupLanguageNotice'.tr()),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.setLocale(locale);
                _iconPath = icon;
                Navigator.pop(context);
              },
              child: Text(
                'settingsPupupContinue'.tr(),
              ),
            )
          ],
        );
      },
    );
  }

  void _popupLanguageMenu() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          'settingsLanguagePopup'.tr(),
          style: TextStyle(fontSize: 18.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('settingsPopupButtonCancel'.tr()),
          )
        ],
        content: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width / 1.5,
          child: ListView.builder(
            padding: EdgeInsets.only(top: 20.h),
            itemCount: _allLocales.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(bottom: 35.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _noticeAndChangeLanguage(
                      locale: _allLocales[index]['locale'],
                      icon: _allLocales[index]['icon']);
                },
                child: Container(
                  color: Colors.transparent, //para ter hit box no row inteira
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_allLocales[index]['text']),
                      Image.asset(
                        _allLocales[index]['icon'],
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
      child: Container(
        height: 45.h,
        child: OutlinedButton(
          onPressed: _popupLanguageMenu,
          style: OutlinedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              side: BorderSide(color: Colors.black, width: 2.w)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Text(
                  'settingsLanguageTitle'.tr(),
                  style: TextStyle(fontSize: 18.sp),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: Image.asset(
                  _iconPath,
                  height: 26.h,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

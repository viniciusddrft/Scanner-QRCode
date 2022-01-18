import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/core/theme/theme_app.dart';
import 'package:scannerqrcode/src/shared/themes/text_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonSetTheme extends StatefulWidget {
  const ButtonSetTheme({Key? key}) : super(key: key);

  @override
  State<ButtonSetTheme> createState() => _ButtonSetThemeState();
}

class _ButtonSetThemeState extends State<ButtonSetTheme> {
  final ValueNotifier<Icon> icon = ValueNotifier<Icon>(const Icon(Icons.error));

  @override
  void initState() {
    AppTextThemes().addListener(() => setState(() {}));
    ThemeApp.getThemeSaved().then((theme) {
      if (theme != null) {
        if (theme == 'system') {
          setIconSystem();
        } else if (theme == 'dark') {
          setIconDark();
        } else if (theme == 'light') {
          setIconLight();
        }
      } else {
        setIconSystem();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    icon.dispose();
    super.dispose();
  }

  void setIconSystem() => icon.value = Icon(
        Icons.brightness_4,
        color: ThemeApp.isDarkThemeSystem ? Colors.blue : Colors.yellow,
        size: 28.sp,
      );

  void setIconDark() =>
      icon.value = Icon(Icons.dark_mode, color: Colors.blue, size: 28.sp);

  void setIconLight() =>
      icon.value = Icon(Icons.light_mode, color: Colors.yellow, size: 28.sp);

  List<Map<String, dynamic>> _allThemes(context) => [
        {
          'text': AppLocalizations.of(context)!.settingsSystemTheme,
          'icon': Icons.brightness_4,
          'color': ThemeApp.isDarkThemeSystem ? Colors.blue : Colors.yellow,
          'theme': 'system',
        },
        {
          'text': AppLocalizations.of(context)!.settingsLightTheme,
          'icon': Icons.light_mode,
          'color': Colors.yellow,
          'theme': 'light'
        },
        {
          'text': AppLocalizations.of(context)!.settingsDarkTheme,
          'icon': Icons.dark_mode,
          'color': Colors.blue,
          'theme': 'dark'
        },
      ];

  List<Map<String, dynamic>> get allThemes => _allThemes(context);

  void _popupChangeTheme() => showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.settingsChooseTheTheme,
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
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 20.sp, left: 10.sp, right: 10.sp),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: BorderSide(color: Colors.black, width: 2.w),
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    if (allThemes[index]['theme'] == 'system') {
                      ThemeApp.changeTheme(ThemeApp.themeSystem);
                      setIconSystem();
                      SharedPreferences.getInstance().then(
                        (value) => value.setString('theme', 'system'),
                      );
                    } else if (allThemes[index]['theme'] == 'dark') {
                      ThemeApp.changeTheme(Brightness.dark);
                      setIconDark();
                      SharedPreferences.getInstance().then(
                        (value) => value.setString('theme', 'dark'),
                      );
                    } else if (allThemes[index]['theme'] == 'light') {
                      ThemeApp.changeTheme(Brightness.light);
                      setIconLight();
                      SharedPreferences.getInstance().then(
                        (value) => value.setString('theme', 'light'),
                      );
                    }
                    AppTextThemes().updateTextsThemeApp();
                  },
                  child: Container(
                    height: 45.h,
                    color:
                        Colors.transparent, //to have hit box on the entire row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          allThemes[index]['text'],
                          style: AppTextThemes.buttonsPopupSettings,
                        ),
                        Icon(
                          allThemes[index]['icon'],
                          color: allThemes[index]['color'],
                          size: 28.sp,
                        )
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
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      child: SizedBox(
        height: 45.h,
        child: OutlinedButton(
          onPressed: _popupChangeTheme,
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
                  AppLocalizations.of(context)!.settingsChangeTheme,
                  style: AppTextThemes.buttonsSettings,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.w, top: 7.h, bottom: 7.h),
                child: ValueListenableBuilder(
                  valueListenable: icon,
                  builder: (BuildContext context, Icon value, Widget? child) =>
                      value,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

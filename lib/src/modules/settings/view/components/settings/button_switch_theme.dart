import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/theme/theme_app.dart';

class ButtonSwicthTheme extends StatefulWidget {
  const ButtonSwicthTheme({super.key});

  @override
  State<ButtonSwicthTheme> createState() => _ButtonSwicthThemeState();
}

class _ButtonSwicthThemeState extends State<ButtonSwicthTheme> {
  final ValueNotifier<Icon> icon = ValueNotifier<Icon>(
    Icon(
      Icons.brightness_4,
      color: ThemeApp.isDarkThemeSystem ? Colors.blue : Colors.yellow,
    ),
  );

  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;

    super.didChangeDependencies();
  }

  void setIconSystem() => icon.value = Icon(
        Icons.brightness_4,
        color: ThemeApp.isDarkThemeSystem ? Colors.blue : Colors.yellow,
      );

  void setIconDark() =>
      icon.value = const Icon(Icons.dark_mode, color: Colors.blue);

  void setIconLight() =>
      icon.value = const Icon(Icons.light_mode, color: Colors.yellow);

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
            height: _size.height * 0.3,
            width: _size.width * 0.75,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(color: Colors.transparent, width: 2),
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
                  },
                  child: Container(
                    height: 45,
                    color:
                        Colors.transparent, //to have hit box on the entire row
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          allThemes[index]['text'],
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Icon(
                          allThemes[index]['icon'],
                          color: allThemes[index]['color'],
                          size: 28,
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
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: EdgeInsets.zero,
          primary: Theme.of(context).backgroundColor,
        ),
        onPressed: _popupChangeTheme,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: ValueListenableBuilder(
                  valueListenable: icon,
                  builder: (BuildContext context, Icon value, Widget? child) =>
                      value,
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                  AppLocalizations.of(context)!.settingsApptheme,
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

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../../core/theme/theme_app.dart';

class ButtonSwicthTheme extends StatefulWidget {
  const ButtonSwicthTheme({super.key});

  @override
  State<ButtonSwicthTheme> createState() => _ButtonSwicthThemeState();
}

class _ButtonSwicthThemeState extends State<ButtonSwicthTheme> {
  late final Size size = MediaQuery.sizeOf(context);

  late final ValueNotifier<Icon> icon = ValueNotifier<Icon>(
    Icon(
      Icons.brightness_4,
      color: ThemeAppNotifier.of(context).value == ThemeMode.dark
          ? Colors.blue
          : Colors.yellow,
    ),
  );

  @override
  void didChangeDependencies() {
    if (ThemeAppNotifier.of(context).value == ThemeMode.system) {
      setIconSystem();
    } else if (ThemeAppNotifier.of(context).value == ThemeMode.dark) {
      setIconDark();
    } else {
      setIconLight();
    }
    super.didChangeDependencies();
  }

  void setIconSystem() => icon.value = Icon(
        Icons.brightness_4,
        color: WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.dark
            ? Colors.blue
            : Colors.yellow,
      );

  void setIconDark() =>
      icon.value = const Icon(Icons.dark_mode, color: Colors.blue);

  void setIconLight() =>
      icon.value = const Icon(Icons.light_mode, color: Colors.yellow);

  List<Map<String, Object>> _allThemes(context) => [
        {
          'text': AppLocalizations.of(context)!.settingsSystemTheme,
          'icon': Icons.brightness_4,
          'color':
              WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                      Brightness.dark
                  ? Colors.blue
                  : Colors.yellow,
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

  List<Map<String, Object>> get allThemes => _allThemes(context);

  void _popupChangeTheme(Size size) => showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          key: const Key('popup change theme'),
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
            height: size.height * 0.3,
            width: size.width * 0.75,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    side: const BorderSide(color: Colors.transparent, width: 2),
                  ),
                  onPressed: () {
                    Navigator.pop(context);

                    if (allThemes[index]['theme'] == 'system') {
                      ThemeAppNotifier.of(context)
                          .changeTheme(ThemeMode.system);
                      setIconSystem();
                    } else if (allThemes[index]['theme'] == 'dark') {
                      ThemeAppNotifier.of(context).changeTheme(ThemeMode.dark);
                      setIconDark();
                    } else if (allThemes[index]['theme'] == 'light') {
                      ThemeAppNotifier.of(context).changeTheme(ThemeMode.light);
                      setIconLight();
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
                          allThemes[index]['text'] as String,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        Icon(
                          allThemes[index]['icon'] as IconData,
                          color: allThemes[index]['color'] as Color,
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
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.surface,
          padding: EdgeInsets.zero,
        ),
        onPressed: () => _popupChangeTheme(size),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.07),
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

  @override
  void dispose() {
    icon.dispose();
    super.dispose();
  }
}

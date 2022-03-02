import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonSwitchColor extends StatefulWidget {
  final String textButton;
  final ValueNotifier<Color> colorChange;
  final String savePreferenceKey;
  const ButtonSwitchColor(
      {required this.textButton,
      required this.colorChange,
      required this.savePreferenceKey,
      Key? key})
      : super(key: key);

  @override
  _ButtonSwitchColorState createState() => _ButtonSwitchColorState();
}

class _ButtonSwitchColorState extends State<ButtonSwitchColor> {
  static const List<Color> _colors = [
    Colors.black,
    Colors.white,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.orange,
    Colors.brown,
    Colors.cyan,
    Colors.pink,
    Colors.purple,
    Colors.yellow,
    Colors.lime,
    Colors.indigo,
    Colors.teal,
    Color(0xff303030)
  ];

  void _popupChangeColorQR({
    required ValueNotifier<Color> colorButton,
    required String savePreferenceKey,
    required Size size,
  }) =>
      showDialog<void>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            AppLocalizations.of(context)!.settingsPopupColorTitle,
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
            height: size.height * 0.5,
            width: size.width * 0.6,
            child: GridView.builder(
              itemCount: _colors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: _colors[index],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                ),
                onPressed: () {
                  colorButton.value = _colors[index];
                  SharedPreferences.getInstance().then(
                    (preference) => preference.setInt(
                        savePreferenceKey, _colors[index].value),
                  );
                  Navigator.pop(context);
                },
                child: Container(),
              ),
            ),
          ),
        ),
      );

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
        onPressed: () {
          _popupChangeColorQR(
            colorButton: widget.colorChange,
            savePreferenceKey: widget.savePreferenceKey,
            size: _size,
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: ValueListenableBuilder(
                    valueListenable: widget.colorChange,
                    builder:
                        (BuildContext context, Color value, Widget? child) =>
                            Container(
                      height: _size.height * 0.025,
                      width: _size.height * 0.025,
                      decoration: BoxDecoration(
                        color: value,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(
                          color: value,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(widget.textButton,
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

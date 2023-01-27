import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

enum ColorType { colorQRBackground, colorQRCode, colorQRCodeEye }

class ButtonSwitchColor extends StatefulWidget {
  final ColorType colorType;

  const ButtonSwitchColor.colorQRBackground({super.key})
      : colorType = ColorType.colorQRBackground;
  const ButtonSwitchColor.colorQRCode({super.key})
      : colorType = ColorType.colorQRCode;
  const ButtonSwitchColor.colorQRCodeEye({super.key})
      : colorType = ColorType.colorQRCodeEye;

  @override
  State<ButtonSwitchColor> createState() => _ButtonSwitchColorState();
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

  late final Size _size = MediaQuery.of(context).size;

  void _popupChangeColorQR() => showDialog<void>(
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
            height: _size.height * 0.5,
            width: _size.width * 0.6,
            child: GridView.builder(
              itemCount: _colors.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: _colors[index],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(360),
                  ),
                ),
                onPressed: () {
                  SettingsQRCodeNotifier.of(context).changeColor(
                      widget.colorType == ColorType.colorQRBackground
                          ? 'colorQRBackground'
                          : widget.colorType == ColorType.colorQRCode
                              ? 'colorQRCode'
                              : 'colorQRCodeEye',
                      _colors[index]);
                  debugPrint(widget.colorType == ColorType.colorQRBackground
                      ? 'colorQRBackground'
                      : widget.colorType == ColorType.colorQRCode
                          ? 'colorQRCode'
                          : 'colorQRCodeEye');
                  debugPrint(_colors[index].toString());
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
    return SizedBox(
      height: _size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.zero,
        ),
        onPressed: _popupChangeColorQR,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              Flexible(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Container(
                    height: _size.height * 0.025,
                    width: _size.height * 0.025,
                    decoration: BoxDecoration(
                      color: widget.colorType == ColorType.colorQRBackground
                          ? SettingsQRCodeNotifier.of(context).colorQRBackground
                          : widget.colorType == ColorType.colorQRCode
                              ? SettingsQRCodeNotifier.of(context).colorQRCode
                              : SettingsQRCodeNotifier.of(context)
                                  .colorQRCodeEye,
                      borderRadius: BorderRadius.circular(360),
                      border: Border.all(
                        color: widget.colorType == ColorType.colorQRBackground
                            ? SettingsQRCodeNotifier.of(context)
                                .colorQRBackground
                            : widget.colorType == ColorType.colorQRCode
                                ? SettingsQRCodeNotifier.of(context).colorQRCode
                                : SettingsQRCodeNotifier.of(context)
                                    .colorQRCodeEye,
                        width: 3,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 5,
                child: Text(
                    widget.colorType == ColorType.colorQRBackground
                        ? AppLocalizations.of(context)!
                            .settingsButtonColorbackground
                        : widget.colorType == ColorType.colorQRCode
                            ? AppLocalizations.of(context)!
                                .settingsButtonColorCode
                            : AppLocalizations.of(context)!
                                .settingsButtonColorEye,
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

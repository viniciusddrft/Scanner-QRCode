import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/settings_create_qrcode.dart';

class ButtonSwitchLogo extends StatefulWidget {
  const ButtonSwitchLogo({super.key});

  @override
  State<ButtonSwitchLogo> createState() => _ButtonSwitchLogoState();
}

class _ButtonSwitchLogoState extends State<ButtonSwitchLogo> {
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  void _popupSetLogo() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: _size.height * 0.20,
          width: _size.width * 0.25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: AppLocalizations.of(context)!.settingsImageTooltipAdd,
                onPressed: () => _setLogo().then(
                  (_) => Navigator.pop(context),
                ),
                icon: const Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 30,
                ),
              ),
              IconButton(
                tooltip:
                    AppLocalizations.of(context)!.settingsImageTooltipRemove,
                onPressed: () {
                  SettingsCreateQRCode.logoPath.value = null;
                  SharedPreferences.getInstance().then(
                    (SharedPreferences preference) => preference.remove('logo'),
                  );
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.delete_outline,
                  size: 30,
                ),
              )
            ],
          ),
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
      ),
    );
  }

  Future<void> _setLogo() async =>
      ImagePicker().pickImage(source: ImageSource.gallery).then(
        (XFile? value) {
          if (value != null) {
            SettingsCreateQRCode.logoPath.value = value.path;
            SharedPreferences.getInstance().then(
              (SharedPreferences preference) =>
                  preference.setString('logo', value.path),
            );
          }
        },
      );

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
        onPressed: _popupSetLogo,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: SettingsCreateQRCode.logoPath,
                builder: (BuildContext context, value, Widget? child) =>
                    SettingsCreateQRCode.logoPath.value != null
                        ? Flexible(
                            flex: 5,
                            child: Image.file(
                              File(SettingsCreateQRCode.logoPath.value
                                  as String),
                              width: _size.height * 0.05,
                              height: _size.height * 0.05,
                            ),
                          )
                        : Flexible(
                            flex: 1,
                            child: Icon(
                              Icons.photo_outlined,
                              color: Theme.of(context).iconTheme.color,
                            ),
                          ),
              ),
              const Spacer(),
              Flexible(
                flex: 6,
                child: Text(
                    AppLocalizations.of(context)!.settingsQRCodeImageCenter,
                    style: Theme.of(context).textTheme.labelMedium),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

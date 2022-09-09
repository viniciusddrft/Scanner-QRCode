import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../shared/settings_qrcode/controller/settings_create_qrcode_controller.dart';

class ButtonSwitchLogo extends StatefulWidget {
  const ButtonSwitchLogo({super.key});

  @override
  State<ButtonSwitchLogo> createState() => _ButtonSwitchLogoState();
}

class _ButtonSwitchLogoState extends State<ButtonSwitchLogo> {
  late final Size _size = MediaQuery.of(context).size;

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
                  SettingsCreateQRCodeController.logoPath.value = null;
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
            SettingsCreateQRCodeController.logoPath.value = value.path;
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
          backgroundColor: Theme.of(context).backgroundColor,
          padding: EdgeInsets.zero,
        ),
        onPressed: _popupSetLogo,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
          child: Row(
            children: [
              ValueListenableBuilder(
                valueListenable: SettingsCreateQRCodeController.logoPath,
                builder: (BuildContext context, value, Widget? child) =>
                    SettingsCreateQRCodeController.logoPath.value != null
                        ? Flexible(
                            flex: 5,
                            child: Image.file(
                              File(SettingsCreateQRCodeController.logoPath.value
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

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ButtonCreateQRCodeSetColor extends StatefulWidget {
  final String textButton;
  final ValueNotifier<Color> colorChange;
  final String savePreferenceKey;
  const ButtonCreateQRCodeSetColor(
      {required this.colorChange,
      required this.textButton,
      required this.savePreferenceKey,
      Key? key})
      : super(key: key);

  @override
  State<ButtonCreateQRCodeSetColor> createState() =>
      _ButtonCreateQRCodeSetColorState();
}

class _ButtonCreateQRCodeSetColorState
    extends State<ButtonCreateQRCodeSetColor> {
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
  void _popupChangeColorQR(
      {required ValueNotifier<Color> colorButton,
      required String savePreferenceKey}) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          AppLocalizations.of(context)!.settingsPopupColorTitle,
          style: TextStyle(fontSize: 22.sp),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:
                Text(AppLocalizations.of(context)!.settingsPopupButtonCancel),
          )
        ],
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 1.7,
          width: MediaQuery.of(context).size.width / 1.5,
          child: GridView.builder(
            itemCount: _colors.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 30.sp,
              mainAxisSpacing: 30.sp,
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
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.colorChange,
      builder: (BuildContext context, value, Widget? child) => Padding(
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
        child: SizedBox(
          height: 45.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.black, width: 2.w)),
            onPressed: () => _popupChangeColorQR(
                colorButton: widget.colorChange,
                savePreferenceKey: widget.savePreferenceKey),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(widget.textButton,
                        style: TextStyle(fontSize: 18.sp)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        color: widget.colorChange.value,
                        borderRadius: BorderRadius.circular(360),
                        border: Border.all(
                          color: widget.colorChange.value,
                          width: 3.w,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

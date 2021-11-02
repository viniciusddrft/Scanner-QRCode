import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/settings/controller/settings_create_qrcode.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonCreateQRCodeSetShape extends StatefulWidget {
  final ValueNotifier<QrDataModuleShape>? bodyShape;
  final ValueNotifier<Color>? colorBodyShape;
  final bool isBody;
  final ValueNotifier<QrEyeShape>? eyeShape;
  final ValueNotifier<Color>? colorEyeShape;
  final bool isEye;

  //this class has a constructor to change the qr code's body or eye parameters
  //and though booleans it sets the texts and popup options

  const ButtonCreateQRCodeSetShape.eye({
    required this.eyeShape,
    required this.colorEyeShape,
  })  : isEye = true,
        bodyShape = null,
        colorBodyShape = null,
        isBody = false;

  const ButtonCreateQRCodeSetShape.body({
    required this.bodyShape,
    required this.colorBodyShape,
  })  : this.isBody = true,
        eyeShape = null,
        colorEyeShape = null,
        isEye = false;

  @override
  State<ButtonCreateQRCodeSetShape> createState() =>
      _ButtonCreateQRCodeSetShapeState();
}

class _ButtonCreateQRCodeSetShapeState
    extends State<ButtonCreateQRCodeSetShape> {
  late ValueNotifier<Color> _color;
  late ValueNotifier<dynamic> _shape;

  @override
  void initState() {
    if (widget.isBody && !widget.isEye) {
      _color = widget.colorBodyShape!;
      _shape = widget.bodyShape!;
    } else if (widget.isEye && !widget.isBody) {
      _color = widget.colorEyeShape!;
      _shape = widget.eyeShape!;
    }
    super.initState();
  }

  void _popupChangeShapeQR() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: widget.isEye && !widget.isBody
            ? Text('settingsPopupColorEyeTitle'.tr())
            : Text('settingsPopupColorShapeTitle'.tr()),
        content: Container(
          height: MediaQuery.of(context).size.height / 4,
          width: MediaQuery.of(context).size.width / 1.5,
          child: Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: GridView.builder(
              itemCount: widget.isEye && !widget.isBody
                  ? QrEyeShape.values.length
                  : QrDataModuleShape.values.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  if (widget.isEye && !widget.isBody) {
                    SettingsCreateQRCode.shapeQRCodeEye.value =
                        QrEyeShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCodeEye', index));

                    Navigator.pop(context);
                  } else {
                    SettingsCreateQRCode.shapeQRCode.value =
                        QrDataModuleShape.values[index];

                    SharedPreferences.getInstance().then((preference) =>
                        preference.setInt('shapeQRCode', index));

                    Navigator.pop(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: widget.isEye && !widget.isBody
                        ? BorderRadius.circular(
                            QrEyeShape.values[index] == QrEyeShape.square
                                ? 0
                                : 360)
                        //type Body
                        : BorderRadius.circular(
                            QrDataModuleShape.values[index] ==
                                    QrDataModuleShape.square
                                ? 0
                                : 360),
                    border: Border.all(
                      color: widget.isEye && !widget.isBody
                          ? SettingsCreateQRCode.colorQRCodeEye.value
                          //type Body
                          : SettingsCreateQRCode.colorQRCode.value,
                      width: 15.w,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('settingsPopupButtonCancel'.tr()),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([_color, _shape]),
      builder: (BuildContext context, Widget? child) => Padding(
        padding:
            EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
        child: Container(
          height: 45.h,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                side: BorderSide(color: Colors.black, width: 2.w)),
            onPressed: () => _popupChangeShapeQR(),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.w),
                    child: Text(
                      widget.isEye && !widget.isBody
                          ? 'settingsButtonShapeEyeQR'.tr()
                          : 'settingsButtonShapeQR'.tr(),
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 15.w),
                    child: Container(
                      height: 20.sp,
                      width: 20.sp,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: widget.isEye && !widget.isBody
                            ? BorderRadius.circular(
                                SettingsCreateQRCode.shapeQRCodeEye.value ==
                                        QrEyeShape.square
                                    ? 0
                                    : 360)
                            //type Body
                            : BorderRadius.circular(
                                SettingsCreateQRCode.shapeQRCode.value ==
                                        QrDataModuleShape.square
                                    ? 0
                                    : 360),
                        border: Border.all(
                          color: _color.value,
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

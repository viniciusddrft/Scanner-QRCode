import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/shared/launch_link/launch_link.dart';
import 'package:easy_localization/easy_localization.dart';

class ButtonUrl extends StatefulWidget {
  final String link;
  const ButtonUrl({required this.link, Key? key}) : super(key: key);

  @override
  State<ButtonUrl> createState() => _ButtonUrlState();
}

class _ButtonUrlState extends State<ButtonUrl> {
  void _popupError() async {
    Future.delayed(const Duration(seconds: 1), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('scanResultpopupError'.tr() + ' :/ '),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.h, bottom: 100.h, left: 20.w),
      child: ElevatedButton(
        onPressed: () => launchLink(widget.link, onError: _popupError),
        child: SizedBox(
          width: 130.w,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'scanResultQrButtonOpen'.tr(),
              style: TextStyle(fontSize: 14.sp),
            ),
            const Icon(Icons.open_in_browser)
          ]),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/result_read_code/components/button_url.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:clipboard/clipboard.dart';
import 'package:scannerqrcode/src/shared/admob/controller/admob_controller.dart';
import 'package:scannerqrcode/src/shared/admob/widget/native_ad.dart';
import 'package:scannerqrcode/src/shared/themes/text_themes.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ResultReadCode extends StatefulWidget {
  final String result;
  final BarcodeType typeCode;
  const ResultReadCode({required this.result, required this.typeCode, Key? key})
      : super(key: key);
  @override
  _ResultReadCodeState createState() => _ResultReadCodeState();
}

class _ResultReadCodeState extends State<ResultReadCode> {
  late final Widget _button;

  @override
  void initState() {
    if (widget.typeCode == BarcodeType.url) {
      _button = ButtonUrl(link: widget.result);
    } else {
      _button = Container();
    }
    super.initState();
  }

  void _popupCopyBoard() {
    Future.delayed(
        const Duration(milliseconds: 500), () => Navigator.pop(context));
    showDialog<void>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(AppLocalizations.of(context)!.scanResultPopupCopy + '.'),
      ),
    );
  }

  Widget returnButton() => _button;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.0.h, left: 30.w, bottom: 10.w),
            child: Text(
              AppLocalizations.of(context)!.scanResultQrTitle,
              style: AppTextThemes.readQrcodeResult,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 27.w),
            width: 500.w,
            height: 70.h,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.transparent.withOpacity(0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Text(
                          widget.result,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: AppLocalizations.of(context)!.scanResultQrToolTip,
                    onPressed: () => FlutterClipboard.copy(widget.result).then(
                      (_) => _popupCopyBoard(),
                    ),
                    icon: const Icon(Icons.copy),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h, bottom: 100.h),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  onPressed: () => Share.share(widget.result),
                  child: SizedBox(
                    width: 130.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.scanResultQrButtonShare,
                          style: AppTextThemes.readQrcodeButtons,
                        ),
                        const Icon(Icons.share)
                      ],
                    ),
                  ),
                ),
              ),
              returnButton()
            ],
          ),
          Expanded(
            child: AdmobNativeAd(
              adUnitId: AdmobController.nativeAdUnitIDRectangular,
              factoryId: 'rectangular',
              nativeAdOptions: NativeAdOptions(
                videoOptions: VideoOptions(startMuted: false),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

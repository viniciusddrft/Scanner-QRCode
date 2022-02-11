import 'package:flutter/material.dart';
import 'package:scannerqrcode/src/modules/createqrcode/view/create_qr_code_menu/create_qrcode_menu_view.dart';
import 'package:scannerqrcode/src/modules/home/controller/home_controller.dart';
import 'package:scannerqrcode/src/modules/readqrcode/view/read_qr_code_menu/read_qr_code_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scannerqrcode/src/modules/settings/view/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:scannerqrcode/src/shared/admob/controller/admob_controller.dart';
import 'package:scannerqrcode/src/shared/admob/widget/native_ad.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    HomeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 35.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                tooltip: AppLocalizations.of(context)!.homeToolTipView1,
                onPressed: () => _pageController.animateToPage(0,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.qrcodeButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.qr_code,
                      color: HomeController.qrcodeButton.value),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                tooltip: AppLocalizations.of(context)!.homeToolTipView2,
                onPressed: () => _pageController.animateToPage(1,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.createButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.border_color,
                      color: HomeController.createButton.value),
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButton(
                tooltip: AppLocalizations.of(context)!.homeToolTipView3,
                onPressed: () => _pageController.animateToPage(2,
                    duration: const Duration(
                      milliseconds: 500,
                    ),
                    curve: Curves.decelerate),
                icon: ValueListenableBuilder(
                  valueListenable: HomeController.settingsButton,
                  builder: (BuildContext context, value, Widget? child) => Icon(
                      Icons.settings,
                      color: HomeController.settingsButton.value),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (valueControllerPage) =>
            HomeController.appBarControlleIconsColors(valueControllerPage),
        children: const [
          ReadQRCodePage(),
          CreateQRCodeMenu(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 75,
        child: AdmobNativeAd(
          adUnitId: AdmobController.nativeAdUnitIDListTile,
          factoryId: 'listTile',
        ),
      ),
    );
  }
}

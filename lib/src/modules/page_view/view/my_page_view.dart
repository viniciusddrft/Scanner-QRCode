import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../shared/admob/controller/admob_controller.dart';
import '../../../shared/admob/widget/native_ad.dart';
import '../../createqrcode/view/create_qr_code_menu/create_qrcode_menu_view.dart';
import '../../readqrcode/view/read_qr_code_menu/read_qr_code_view.dart';
import '../../settings/view/settings_page.dart';
import '../controller/my_page_view_controller.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});
  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final PageController _pageController = PageController(initialPage: 0);
  final MyPageViewController _myPageViewController = MyPageViewController();
  late final Size _size;

  @override
  void didChangeDependencies() {
    _size = MediaQuery.of(context).size;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _myPageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Padding(
          padding: EdgeInsets.only(top: _size.height * 0.044),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 6,
                child: IconButton(
                  tooltip: AppLocalizations.of(context)!.homeToolTipView1,
                  onPressed: () => _pageController.animateToPage(0,
                      duration: Duration(
                        milliseconds: _pageController.page == 2 ? 750 : 500,
                      ),
                      curve: Curves.decelerate),
                  icon: ValueListenableBuilder(
                    valueListenable: _myPageViewController.qrcodeButton,
                    builder: (BuildContext context, value, Widget? child) =>
                        Icon(Icons.qr_code,
                            color: _myPageViewController.qrcodeButton.value),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 6,
                child: IconButton(
                  tooltip: AppLocalizations.of(context)!.homeToolTipView2,
                  onPressed: () => _pageController.animateToPage(1,
                      duration: const Duration(
                        milliseconds: 500,
                      ),
                      curve: Curves.decelerate),
                  icon: ValueListenableBuilder(
                    valueListenable: _myPageViewController.createButton,
                    builder: (BuildContext context, value, Widget? child) =>
                        Icon(Icons.border_color,
                            color: _myPageViewController.createButton.value),
                  ),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 6,
                child: IconButton(
                  tooltip: AppLocalizations.of(context)!.homeToolTipView3,
                  onPressed: () => _pageController.animateToPage(2,
                      duration: Duration(
                        milliseconds: _pageController.page == 0 ? 750 : 500,
                      ),
                      curve: Curves.decelerate),
                  icon: ValueListenableBuilder(
                    valueListenable: _myPageViewController.settingsButton,
                    builder: (BuildContext context, value, Widget? child) =>
                        Icon(Icons.settings,
                            color: _myPageViewController.settingsButton.value),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _myPageViewController.appBarControlleIconsColors,
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

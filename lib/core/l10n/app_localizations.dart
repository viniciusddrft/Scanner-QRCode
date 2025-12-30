import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('en', 'US'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('zh'),
    Locale('zh', 'CN')
  ];

  /// No description provided for @homeToolTipView1.
  ///
  /// In en_US, this message translates to:
  /// **'Read QRCode'**
  String get homeToolTipView1;

  /// No description provided for @homeToolTipView2.
  ///
  /// In en_US, this message translates to:
  /// **'Create QRCode'**
  String get homeToolTipView2;

  /// No description provided for @homeToolTipView3.
  ///
  /// In en_US, this message translates to:
  /// **'Settings'**
  String get homeToolTipView3;

  /// No description provided for @readQRCodeTextButtonReadCamera.
  ///
  /// In en_US, this message translates to:
  /// **'Read from camera'**
  String get readQRCodeTextButtonReadCamera;

  /// No description provided for @readQRCodeTextButtonReadGallery.
  ///
  /// In en_US, this message translates to:
  /// **'Read from gallery'**
  String get readQRCodeTextButtonReadGallery;

  /// No description provided for @createQRCodeMenuText.
  ///
  /// In en_US, this message translates to:
  /// **'Text'**
  String get createQRCodeMenuText;

  /// No description provided for @createQRCodeMenuWifi.
  ///
  /// In en_US, this message translates to:
  /// **'WiFi'**
  String get createQRCodeMenuWifi;

  /// No description provided for @createQRCodeMenuLink.
  ///
  /// In en_US, this message translates to:
  /// **'Link'**
  String get createQRCodeMenuLink;

  /// No description provided for @createQRCodeMenuContact.
  ///
  /// In en_US, this message translates to:
  /// **'Contact'**
  String get createQRCodeMenuContact;

  /// No description provided for @createQRCodeMenuGithub.
  ///
  /// In en_US, this message translates to:
  /// **'Github'**
  String get createQRCodeMenuGithub;

  /// No description provided for @createQRCodeMenuWhatsapp.
  ///
  /// In en_US, this message translates to:
  /// **'Whatsapp'**
  String get createQRCodeMenuWhatsapp;

  /// No description provided for @createQRCodeMenuInstagram.
  ///
  /// In en_US, this message translates to:
  /// **'Instagram'**
  String get createQRCodeMenuInstagram;

  /// No description provided for @createQRCodeMenuTiktok.
  ///
  /// In en_US, this message translates to:
  /// **'TikTok'**
  String get createQRCodeMenuTiktok;

  /// No description provided for @createQRCodeMenuFacebook.
  ///
  /// In en_US, this message translates to:
  /// **'Facebook'**
  String get createQRCodeMenuFacebook;

  /// No description provided for @createQRCodeMenuOnlyfans.
  ///
  /// In en_US, this message translates to:
  /// **'Onlyfans'**
  String get createQRCodeMenuOnlyfans;

  /// No description provided for @createQRCodeMenuPrivacy.
  ///
  /// In en_US, this message translates to:
  /// **'Privacy'**
  String get createQRCodeMenuPrivacy;

  /// No description provided for @createQRCodeMenuYoutube.
  ///
  /// In en_US, this message translates to:
  /// **'Youtube'**
  String get createQRCodeMenuYoutube;

  /// No description provided for @createQRCodeMenuTwitter.
  ///
  /// In en_US, this message translates to:
  /// **'Twitter'**
  String get createQRCodeMenuTwitter;

  /// No description provided for @createQRCodeMenuTwitch.
  ///
  /// In en_US, this message translates to:
  /// **'Twitch'**
  String get createQRCodeMenuTwitch;

  /// No description provided for @createQRCodeMenuReddit.
  ///
  /// In en_US, this message translates to:
  /// **'Reddit'**
  String get createQRCodeMenuReddit;

  /// No description provided for @createQRCodeTitleText.
  ///
  /// In en_US, this message translates to:
  /// **'Create for text'**
  String get createQRCodeTitleText;

  /// No description provided for @createQRCodeTitleWifi.
  ///
  /// In en_US, this message translates to:
  /// **'Create for WiFi'**
  String get createQRCodeTitleWifi;

  /// No description provided for @createQRCodeTitleLink.
  ///
  /// In en_US, this message translates to:
  /// **'Create for link'**
  String get createQRCodeTitleLink;

  /// No description provided for @createQRCodeTitleContact.
  ///
  /// In en_US, this message translates to:
  /// **'Create for contact'**
  String get createQRCodeTitleContact;

  /// No description provided for @createQRCodeTitleGithub.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Github'**
  String get createQRCodeTitleGithub;

  /// No description provided for @createQRCodeTitleWhatsapp.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Whatsapp'**
  String get createQRCodeTitleWhatsapp;

  /// No description provided for @createQRCodeTitleInstagram.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Instagram'**
  String get createQRCodeTitleInstagram;

  /// No description provided for @createQRCodeTitleTiktok.
  ///
  /// In en_US, this message translates to:
  /// **'Create for TikTok'**
  String get createQRCodeTitleTiktok;

  /// No description provided for @createQRCodeTitleFacebook.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Facebook'**
  String get createQRCodeTitleFacebook;

  /// No description provided for @createQRCodeTitleYoutube.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Youtube'**
  String get createQRCodeTitleYoutube;

  /// No description provided for @createQRCodeTitleTwitter.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Twitter'**
  String get createQRCodeTitleTwitter;

  /// No description provided for @createQRCodeTitleTwitch.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Twitch'**
  String get createQRCodeTitleTwitch;

  /// No description provided for @createQRCodeTitleReddit.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Reddit'**
  String get createQRCodeTitleReddit;

  /// No description provided for @createQRCodeTitleOnlyfans.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Onlyfans'**
  String get createQRCodeTitleOnlyfans;

  /// No description provided for @createQRCodeTitlePrivacy.
  ///
  /// In en_US, this message translates to:
  /// **'Create for Privacy'**
  String get createQRCodeTitlePrivacy;

  /// No description provided for @createQRCodeALLButton.
  ///
  /// In en_US, this message translates to:
  /// **'Create QRCode'**
  String get createQRCodeALLButton;

  /// No description provided for @createQRCodeTextLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeTextLabelDecorate;

  /// No description provided for @createQRCodeTextValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'can\'t be empty'**
  String get createQRCodeTextValidatorError;

  /// No description provided for @createQRCodeContactNameLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Name'**
  String get createQRCodeContactNameLabelDecorate;

  /// No description provided for @createQRCodeContactNameValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'can\'t be empty'**
  String get createQRCodeContactNameValidatorError;

  /// No description provided for @createQRCodeContactPhoneLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Number'**
  String get createQRCodeContactPhoneLabelDecorate;

  /// No description provided for @createQRCodeContactPhoneValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'can\'t be empty'**
  String get createQRCodeContactPhoneValidatorError;

  /// No description provided for @createQRCodeWhatsappLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Number'**
  String get createQRCodeWhatsappLabelDecorate;

  /// No description provided for @createQRCodeWhatsappValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'can\'t be empty'**
  String get createQRCodeWhatsappValidatorError;

  /// No description provided for @createQRCodeInstagramMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put your Instagram link or username (without the @) and the QR code will point directly to your profile.'**
  String get createQRCodeInstagramMsg;

  /// No description provided for @createQRCodeInstagramLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'@'**
  String get createQRCodeInstagramLabelDecorate;

  /// No description provided for @createQRCodeInstagramValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeInstagramValidatorError;

  /// No description provided for @createQRCodeWiFiMsg1.
  ///
  /// In en_US, this message translates to:
  /// **'The generated QR code will make it easier for you to join the Wi-Fi network simply by scanning the QR code.'**
  String get createQRCodeWiFiMsg1;

  /// No description provided for @createQRCodeWiFiMsg2.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your network type:'**
  String get createQRCodeWiFiMsg2;

  /// No description provided for @createQRCodeWiFiLabelDecorate1.
  ///
  /// In en_US, this message translates to:
  /// **'Network name'**
  String get createQRCodeWiFiLabelDecorate1;

  /// No description provided for @createQRCodeWiFiValidatorError1.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeWiFiValidatorError1;

  /// No description provided for @createQRCodeWiFiLabelDecorate2.
  ///
  /// In en_US, this message translates to:
  /// **'Password'**
  String get createQRCodeWiFiLabelDecorate2;

  /// No description provided for @createQRCodeWiFiValidatorError2.
  ///
  /// In en_US, this message translates to:
  /// **'At least 8 characters'**
  String get createQRCodeWiFiValidatorError2;

  /// No description provided for @createQRCodeTiktokMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Enter your TikTok link or username (without the @) and the QR code will point directly to your profile.'**
  String get createQRCodeTiktokMsg;

  /// No description provided for @createQRCodeTiktokLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'@'**
  String get createQRCodeTiktokLabelDecorate;

  /// No description provided for @createQRCodeTiktokValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeTiktokValidatorError;

  /// No description provided for @createQRCodeFacebookMsg1.
  ///
  /// In en_US, this message translates to:
  /// **'Paste the facebook link or enter your id'**
  String get createQRCodeFacebookMsg1;

  /// No description provided for @createQRCodeFacebookMsg2.
  ///
  /// In en_US, this message translates to:
  /// **'Example id : https://www.facebook.com/*******.*******.***\''**
  String get createQRCodeFacebookMsg2;

  /// No description provided for @createQRCodeFacebookMsg3.
  ///
  /// In en_US, this message translates to:
  /// **'Id would be this part with * that is in the link of your profile or profile of your page.'**
  String get createQRCodeFacebookMsg3;

  /// No description provided for @createQRCodeFacebookLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeFacebookLabelDecorate;

  /// No description provided for @createQRCodeFacebookValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeFacebookValidatorError;

  /// No description provided for @createQRCodeYoutubeMsg1.
  ///
  /// In en_US, this message translates to:
  /// **'Paste the video or channel link, if you want you can put the id of some video'**
  String get createQRCodeYoutubeMsg1;

  /// No description provided for @createQRCodeYoutubeMsg2.
  ///
  /// In en_US, this message translates to:
  /// **'Example id: https://www.youtube.com/watch?v=***********'**
  String get createQRCodeYoutubeMsg2;

  /// No description provided for @createQRCodeYoutubeMsg3.
  ///
  /// In en_US, this message translates to:
  /// **'Id would be this part with * that is in the video link.'**
  String get createQRCodeYoutubeMsg3;

  /// No description provided for @createQRCodeYoutubeLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeYoutubeLabelDecorate;

  /// No description provided for @createQRCodeYoutubeValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeYoutubeValidatorError;

  /// No description provided for @createQRCodeTwitterMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put the link to your profile or your username and the qrcode will take you to your profile'**
  String get createQRCodeTwitterMsg;

  /// No description provided for @createQRCodeTwitterLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'@'**
  String get createQRCodeTwitterLabelDecorate;

  /// No description provided for @createQRCodeTwitterValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeTwitterValidatorError;

  /// No description provided for @createQRCodeTwitchMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put the link to the live or the name of the author of the live.'**
  String get createQRCodeTwitchMsg;

  /// No description provided for @createQRCodeTwitchLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeTwitchLabelDecorate;

  /// No description provided for @createQRCodeTwitchValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeTwitchValidatorError;

  /// No description provided for @createQRCodeRedditMsg1.
  ///
  /// In en_US, this message translates to:
  /// **'Link to your profile or reddit page or enter the id'**
  String get createQRCodeRedditMsg1;

  /// No description provided for @createQRCodeRedditMsg2.
  ///
  /// In en_US, this message translates to:
  /// **'example: r/*** | u/***'**
  String get createQRCodeRedditMsg2;

  /// No description provided for @createQRCodeRedditLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeRedditLabelDecorate;

  /// No description provided for @createQRCodeRedditValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeRedditValidatorError;

  /// No description provided for @createQRCodeOnlyfansMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put the link of your profile or user'**
  String get createQRCodeOnlyfansMsg;

  /// No description provided for @createQRCodeOnlyfansLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeOnlyfansLabelDecorate;

  /// No description provided for @createQRCodeOnlyfansValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeOnlyfansValidatorError;

  /// No description provided for @createQRCodePrivacyMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put the link of your profile or user'**
  String get createQRCodePrivacyMsg;

  /// No description provided for @createQRCodePrivacyLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodePrivacyLabelDecorate;

  /// No description provided for @createQRCodePrivacyValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodePrivacyValidatorError;

  /// No description provided for @createQRCodeGithubMsg.
  ///
  /// In en_US, this message translates to:
  /// **'Put your link or github user and the qrcode will take you to your profile.'**
  String get createQRCodeGithubMsg;

  /// No description provided for @createQRCodeGithubLabelDecorate.
  ///
  /// In en_US, this message translates to:
  /// **'Write'**
  String get createQRCodeGithubLabelDecorate;

  /// No description provided for @createQRCodeGithubValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeGithubValidatorError;

  /// No description provided for @createQRCodeLinkMsg.
  ///
  /// In en_US, this message translates to:
  /// **'With or without (https://).'**
  String get createQRCodeLinkMsg;

  /// No description provided for @createQRCodeLinkValidatorError.
  ///
  /// In en_US, this message translates to:
  /// **'Can\'t be empty'**
  String get createQRCodeLinkValidatorError;

  /// No description provided for @createResultQRCodeAppBarTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Ready'**
  String get createResultQRCodeAppBarTitle;

  /// No description provided for @createResultQrCodeButtonSave.
  ///
  /// In en_US, this message translates to:
  /// **'Save'**
  String get createResultQrCodeButtonSave;

  /// No description provided for @createResultQrCodeButtonShare.
  ///
  /// In en_US, this message translates to:
  /// **'Share'**
  String get createResultQrCodeButtonShare;

  /// No description provided for @createResultQrPopupSave.
  ///
  /// In en_US, this message translates to:
  /// **'Saved'**
  String get createResultQrPopupSave;

  /// No description provided for @createResultQrPopupError.
  ///
  /// In en_US, this message translates to:
  /// **'Error'**
  String get createResultQrPopupError;

  /// No description provided for @scanViewTooltip1.
  ///
  /// In en_US, this message translates to:
  /// **'Back'**
  String get scanViewTooltip1;

  /// No description provided for @scanViewTooltip2.
  ///
  /// In en_US, this message translates to:
  /// **'Turn on flash'**
  String get scanViewTooltip2;

  /// No description provided for @scanViewTooltip3.
  ///
  /// In en_US, this message translates to:
  /// **'Turn off flash'**
  String get scanViewTooltip3;

  /// No description provided for @scanViewTooltip4.
  ///
  /// In en_US, this message translates to:
  /// **'Change camera'**
  String get scanViewTooltip4;

  /// No description provided for @scanViewTooltip5.
  ///
  /// In en_US, this message translates to:
  /// **'Barcode mode'**
  String get scanViewTooltip5;

  /// No description provided for @scanViewTooltip6.
  ///
  /// In en_US, this message translates to:
  /// **'QRcode mode'**
  String get scanViewTooltip6;

  /// No description provided for @scanResultQrTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Result'**
  String get scanResultQrTitle;

  /// No description provided for @scanResultQrButtonShare.
  ///
  /// In en_US, this message translates to:
  /// **'Share'**
  String get scanResultQrButtonShare;

  /// No description provided for @scanResultQrButtonOpen.
  ///
  /// In en_US, this message translates to:
  /// **'Open'**
  String get scanResultQrButtonOpen;

  /// No description provided for @scanResultQrToolTip.
  ///
  /// In en_US, this message translates to:
  /// **'Copy'**
  String get scanResultQrToolTip;

  /// No description provided for @scanResultPopupCopy.
  ///
  /// In en_US, this message translates to:
  /// **'Copied'**
  String get scanResultPopupCopy;

  /// No description provided for @scanResultpopupError.
  ///
  /// In en_US, this message translates to:
  /// **'Some error happened'**
  String get scanResultpopupError;

  /// No description provided for @settingsVersion.
  ///
  /// In en_US, this message translates to:
  /// **'Version'**
  String get settingsVersion;

  /// No description provided for @settingsTitleCardCreateQrCode.
  ///
  /// In en_US, this message translates to:
  /// **'Creating QRCode'**
  String get settingsTitleCardCreateQrCode;

  /// No description provided for @settingsQRCodeImageCenter.
  ///
  /// In en_US, this message translates to:
  /// **'Image in the center'**
  String get settingsQRCodeImageCenter;

  /// No description provided for @settingsButtonColorbackground.
  ///
  /// In en_US, this message translates to:
  /// **'Background color'**
  String get settingsButtonColorbackground;

  /// No description provided for @settingsButtonColorCode.
  ///
  /// In en_US, this message translates to:
  /// **'Code color'**
  String get settingsButtonColorCode;

  /// No description provided for @settingsButtonColorEye.
  ///
  /// In en_US, this message translates to:
  /// **'Border color'**
  String get settingsButtonColorEye;

  /// No description provided for @settingsButtonShapeEyeQR.
  ///
  /// In en_US, this message translates to:
  /// **'Edge type'**
  String get settingsButtonShapeEyeQR;

  /// No description provided for @settingsButtonShapeQR.
  ///
  /// In en_US, this message translates to:
  /// **'QRCode Body'**
  String get settingsButtonShapeQR;

  /// No description provided for @settingsImage.
  ///
  /// In en_US, this message translates to:
  /// **'Image'**
  String get settingsImage;

  /// No description provided for @settingsImageTooltipAdd.
  ///
  /// In en_US, this message translates to:
  /// **'Add image in qr code'**
  String get settingsImageTooltipAdd;

  /// No description provided for @settingsImageTooltipRemove.
  ///
  /// In en_US, this message translates to:
  /// **'Remove image in qr code'**
  String get settingsImageTooltipRemove;

  /// No description provided for @settingsPopupColorEyeTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Choose the type of border'**
  String get settingsPopupColorEyeTitle;

  /// No description provided for @settingsPopupColorShapeTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Choose your body type'**
  String get settingsPopupColorShapeTitle;

  /// No description provided for @settingsPopupColorTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Choose color'**
  String get settingsPopupColorTitle;

  /// No description provided for @settingsPopupButtonCancel.
  ///
  /// In en_US, this message translates to:
  /// **'Cancel'**
  String get settingsPopupButtonCancel;

  /// No description provided for @settingsLanguageTitle.
  ///
  /// In en_US, this message translates to:
  /// **'Language'**
  String get settingsLanguageTitle;

  /// No description provided for @settingsLanguagePopup.
  ///
  /// In en_US, this message translates to:
  /// **'Languages'**
  String get settingsLanguagePopup;

  /// No description provided for @settingsLanguageNameBrasil.
  ///
  /// In en_US, this message translates to:
  /// **'Brazilian Portuguese'**
  String get settingsLanguageNameBrasil;

  /// No description provided for @settingsLanguageNameUnitedStates.
  ///
  /// In en_US, this message translates to:
  /// **'United States English'**
  String get settingsLanguageNameUnitedStates;

  /// No description provided for @settingsLanguageNameChina.
  ///
  /// In en_US, this message translates to:
  /// **'Chinese from China'**
  String get settingsLanguageNameChina;

  /// No description provided for @settingsPupupContinue.
  ///
  /// In en_US, this message translates to:
  /// **'Continue'**
  String get settingsPupupContinue;

  /// No description provided for @settingsQRCodeExample.
  ///
  /// In en_US, this message translates to:
  /// **'QR code Example'**
  String get settingsQRCodeExample;

  /// No description provided for @settingsQRCodeDownloadPremiumVersion.
  ///
  /// In en_US, this message translates to:
  /// **'Download premium version'**
  String get settingsQRCodeDownloadPremiumVersion;

  /// No description provided for @settingsQRCodeCreation.
  ///
  /// In en_US, this message translates to:
  /// **'Creating the QR Code'**
  String get settingsQRCodeCreation;

  /// No description provided for @settingsContact.
  ///
  /// In en_US, this message translates to:
  /// **'Contact'**
  String get settingsContact;

  /// No description provided for @settingsHelp.
  ///
  /// In en_US, this message translates to:
  /// **'Help'**
  String get settingsHelp;

  /// No description provided for @settingsFrequentProblems.
  ///
  /// In en_US, this message translates to:
  /// **'Frequent problems'**
  String get settingsFrequentProblems;

  /// No description provided for @settingsAboutTheApp.
  ///
  /// In en_US, this message translates to:
  /// **'About the app'**
  String get settingsAboutTheApp;

  /// No description provided for @settingsRateTheApp.
  ///
  /// In en_US, this message translates to:
  /// **'Rate the app'**
  String get settingsRateTheApp;

  /// No description provided for @settingsApptheme.
  ///
  /// In en_US, this message translates to:
  /// **'App theme'**
  String get settingsApptheme;

  /// No description provided for @settingsChooseTheTheme.
  ///
  /// In en_US, this message translates to:
  /// **'Choose the theme'**
  String get settingsChooseTheTheme;

  /// No description provided for @settingsChangeTheme.
  ///
  /// In en_US, this message translates to:
  /// **'Change theme'**
  String get settingsChangeTheme;

  /// No description provided for @settingsSystemTheme.
  ///
  /// In en_US, this message translates to:
  /// **'System theme'**
  String get settingsSystemTheme;

  /// No description provided for @settingsLightTheme.
  ///
  /// In en_US, this message translates to:
  /// **'Light theme'**
  String get settingsLightTheme;

  /// No description provided for @settingsDarkTheme.
  ///
  /// In en_US, this message translates to:
  /// **'Dark theme'**
  String get settingsDarkTheme;

  /// No description provided for @helpProblem1.
  ///
  /// In en_US, this message translates to:
  /// **'The qr code I created was not read'**
  String get helpProblem1;

  /// No description provided for @helpSolution1.
  ///
  /// In en_US, this message translates to:
  /// **'When this happens it could be like cores that were used or the logo, unfortunately this will have to be tested by you but if your qr code doesn\'t work just test some modifications and you will probably be able to do it quietly.'**
  String get helpSolution1;

  /// No description provided for @helpProblem2.
  ///
  /// In en_US, this message translates to:
  /// **'Types of readable codes?'**
  String get helpProblem2;

  /// No description provided for @helpSolution2.
  ///
  /// In en_US, this message translates to:
  /// **'Linear formats: Codabar, Code 39, Code 93, Code 128, EAN-8, EAN-13, ITF, UPC-A, UPC-E \n\n2D formats: Aztec, Data Matrix, PDF417, QR Code'**
  String get helpSolution2;

  /// No description provided for @helpProblem3.
  ///
  /// In en_US, this message translates to:
  /// **'Types of unreadable codes?'**
  String get helpProblem3;

  /// No description provided for @helpSolution3.
  ///
  /// In en_US, this message translates to:
  /// **'1D Barcodes with only one character \n\nBarcodes in ITF format with fewer than six characters \n\nBarcodes encoded with FNC2, FNC3 or FNC4 \n\nQR codes generated in the ECI mode'**
  String get helpSolution3;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pt', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en':
      {
        switch (locale.countryCode) {
          case 'US':
            return AppLocalizationsEnUs();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'CN':
            return AppLocalizationsZhCn();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pt':
      return AppLocalizationsPt();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}

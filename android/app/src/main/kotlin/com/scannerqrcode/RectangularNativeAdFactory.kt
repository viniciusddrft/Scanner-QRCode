package com.scannerqrcode

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.widget.ImageView
import android.widget.TextView
import android.widget.Button
import android.widget.RatingBar
import com.google.android.gms.ads.nativead.MediaView
import com.google.android.gms.ads.nativead.NativeAd
import com.google.android.gms.ads.nativead.NativeAdView
import com.scannerqrcode.R
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class RectangularNativeAdFactory(val context: Context) : GoogleMobileAdsPlugin.NativeAdFactory {

    override fun createNativeAd(
            nativeAd: NativeAd,
            customOptions: MutableMap<String, Any>?
    ): NativeAdView {
        val nativeAdView = LayoutInflater.from(context)
                .inflate(R.layout.rectangular_native_ad, null) as NativeAdView

        with(nativeAdView) {
                    // Set the media view.
            nativeAdView.setMediaView(nativeAdView.findViewById(R.id.ad_media) as MediaView)

            // Set other ad assets.
            nativeAdView.setHeadlineView(nativeAdView.findViewById(R.id.ad_headline))
            nativeAdView.setBodyView(nativeAdView.findViewById(R.id.ad_body))
            nativeAdView.setCallToActionView(nativeAdView.findViewById(R.id.ad_call_to_action))
            nativeAdView.setIconView(nativeAdView.findViewById(R.id.ad_app_icon))
            nativeAdView.setPriceView(nativeAdView.findViewById(R.id.ad_price))
            //nativeAdView.setStarRatingView(nativeAdView.findViewById(R.id.ad_stars))
            nativeAdView.setStoreView(nativeAdView.findViewById(R.id.ad_store))
            nativeAdView.setAdvertiserView(nativeAdView.findViewById(R.id.ad_advertiser))

            // The headline and mediaContent are guaranteed to be in every NativeAd.
            (nativeAdView.getHeadlineView() as TextView).setText(nativeAd.getHeadline())
            nativeAdView.getMediaView().setMediaContent(nativeAd.getMediaContent())

            // These assets aren't guaranteed to be in every NativeAd, so it's important to
            // check before trying to display them.
            if (nativeAd.getBody() == null) {
                nativeAdView.getBodyView().setVisibility(View.INVISIBLE)
            } else {
                nativeAdView.getBodyView().setVisibility(View.VISIBLE)
                (nativeAdView.getBodyView() as TextView).setText(nativeAd.getBody())
            }
            if (nativeAd.getCallToAction() == null) {
                nativeAdView.getCallToActionView().setVisibility(View.INVISIBLE)
            } else {
                nativeAdView.getCallToActionView().setVisibility(View.VISIBLE)
                (nativeAdView.getCallToActionView() as Button).setText(nativeAd.getCallToAction())
            }
            if (nativeAd.getIcon() == null) {
                nativeAdView.getIconView().setVisibility(View.GONE)
            } else {
                (nativeAdView.getIconView() as ImageView).setImageDrawable(nativeAd.getIcon().getDrawable())
                nativeAdView.getIconView().setVisibility(View.VISIBLE)
            }
            if (nativeAd.getPrice() == null) {
                nativeAdView.getPriceView().setVisibility(View.INVISIBLE)
            } else {
                nativeAdView.getPriceView().setVisibility(View.VISIBLE)
                (nativeAdView.getPriceView() as TextView).setText(nativeAd.getPrice())
            }
            if (nativeAd.getStore() == null) {
                nativeAdView.getStoreView().setVisibility(View.INVISIBLE)
            } else {
                nativeAdView.getStoreView().setVisibility(View.VISIBLE)
                (nativeAdView.getStoreView() as TextView).setText(nativeAd.getStore())
            }
           // if (nativeAd.getStarRating() == null) {
            //    nativeAdView.getStarRatingView().setVisibility(View.INVISIBLE)
           // }// else {
            //    (nativeAdView.getStarRatingView() as RatingBar).setRating(nativeAd.getStarRating().floatValue())
            //    nativeAdView.getStarRatingView().setVisibility(View.VISIBLE)
            //}
            if (nativeAd.getAdvertiser() == null) {
                nativeAdView.getAdvertiserView().setVisibility(View.INVISIBLE)
            } else {
                nativeAdView.getAdvertiserView().setVisibility(View.VISIBLE)
                (nativeAdView.getAdvertiserView() as TextView).setText(nativeAd.getAdvertiser())
            }

            // This method tells the Google Mobile Ads SDK that you have finished populating your
            // native ad view with this native ad.
            nativeAdView.setNativeAd(nativeAd)
            return nativeAdView
        }


    }
}
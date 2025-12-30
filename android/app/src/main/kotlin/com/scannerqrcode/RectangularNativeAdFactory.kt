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

        // Set the media view.
        nativeAdView.setMediaView(nativeAdView.findViewById(R.id.ad_media) as MediaView)

        // Set other ad assets.
        nativeAdView.setHeadlineView(nativeAdView.findViewById(R.id.ad_headline))
        nativeAdView.setBodyView(nativeAdView.findViewById(R.id.ad_body))
        nativeAdView.setCallToActionView(nativeAdView.findViewById(R.id.ad_call_to_action))
        nativeAdView.setIconView(nativeAdView.findViewById(R.id.ad_app_icon))
        nativeAdView.setPriceView(nativeAdView.findViewById(R.id.ad_price))
        nativeAdView.setStarRatingView(nativeAdView.findViewById(R.id.ad_stars))
        nativeAdView.setStoreView(nativeAdView.findViewById(R.id.ad_store))
        nativeAdView.setAdvertiserView(nativeAdView.findViewById(R.id.ad_advertiser))

        // The headline and mediaContent are guaranteed to be in every NativeAd.
        (nativeAdView.headlineView as TextView).text = nativeAd.headline
        nativeAdView.mediaView?.setMediaContent(nativeAd.mediaContent!!)

        // These assets aren't guaranteed to be in every NativeAd, so it's important to
        // check before trying to display them.
        if (nativeAd.body == null) {
            nativeAdView.bodyView?.visibility = View.INVISIBLE
        } else {
            nativeAdView.bodyView?.visibility = View.VISIBLE
            (nativeAdView.bodyView as TextView?)?.text = nativeAd.body
        }
        if (nativeAd.callToAction == null) {
            nativeAdView.callToActionView?.visibility = View.INVISIBLE
        } else {
            nativeAdView.callToActionView?.visibility = View.VISIBLE
            (nativeAdView.callToActionView as Button?)?.text = nativeAd.callToAction
        }
        if (nativeAd.icon == null) {
            nativeAdView.iconView?.visibility = View.GONE
        } else {
            (nativeAdView.iconView as ImageView?)?.setImageDrawable(nativeAd.icon?.drawable)
            nativeAdView.iconView?.visibility = View.VISIBLE
        }
        if (nativeAd.price == null) {
            nativeAdView.priceView?.visibility = View.INVISIBLE
        } else {
            nativeAdView.priceView?.visibility = View.VISIBLE
            (nativeAdView.priceView as TextView?)?.text = nativeAd.price
        }
        if (nativeAd.getStore() == null) {
            nativeAdView.getStoreView()?.visibility = View.INVISIBLE
        } else {
            nativeAdView.getStoreView()?.visibility = View.VISIBLE
            (nativeAdView.getStoreView() as TextView?)?.text = nativeAd.getStore()
        }
        if (nativeAd.getStarRating() == null) {
            nativeAdView.getStarRatingView()?.visibility = View.INVISIBLE
        } else {
            (nativeAdView.getStarRatingView() as RatingBar?)?.rating = nativeAd.getStarRating()!!.toFloat()
            nativeAdView.getStarRatingView()?.visibility = View.VISIBLE
        }
        if (nativeAd.getAdvertiser() == null) {
            nativeAdView.getAdvertiserView()?.visibility = View.INVISIBLE
        } else {
            nativeAdView.getAdvertiserView()?.visibility = View.VISIBLE
            (nativeAdView.getAdvertiserView() as TextView?)?.text = nativeAd.getAdvertiser()
        }

        // This method tells the Google Mobile Ads SDK that you have finished populating your
        // native ad view with this native ad.
        nativeAdView.setNativeAd(nativeAd)
        
        return nativeAdView
    }
}
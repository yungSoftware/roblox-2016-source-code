package com.jirbo.adcolony;

public class AdColonyVideoAd {
    private AdColonyAdListener listener;

    public AdColonyVideoAd withListener(AdColonyAdListener listener) {
        this.listener = listener;
        return this;
    }

    public boolean show() {
        // Simulate immediate callback behavior as a no-op for api15
        if (listener != null) {
            AdColonyAd ad = new AdColonyAd();
            try {
                listener.onAdColonyAdStarted(ad);
            } catch (Throwable ignored) {}
            try {
                listener.onAdColonyAdAttemptFinished(ad);
            } catch (Throwable ignored) {}
        }
        return false;
    }
}

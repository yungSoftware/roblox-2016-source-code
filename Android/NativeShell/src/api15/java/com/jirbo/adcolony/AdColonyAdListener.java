package com.jirbo.adcolony;

public interface AdColonyAdListener {
    void onAdColonyAdStarted(AdColonyAd ad);
    void onAdColonyAdAttemptFinished(AdColonyAd ad);
}

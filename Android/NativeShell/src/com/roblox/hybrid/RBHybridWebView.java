package com.roblox.hybrid;

import android.content.Context;
import android.util.AttributeSet;
import android.webkit.WebView;

/**
 * Lightweight stub used on api15 flavor when the Hybrid module is not packaged.
 * Provides the same class name so layout inflation of fragment_webview.xml succeeds.
 * For api19 flavor, the real implementation is supplied by the ':Hybrid' module.
 */
public class RBHybridWebView extends WebView {
    public RBHybridWebView(Context context) {
        super(context);
        init();
    }

    public RBHybridWebView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public RBHybridWebView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    // Called by some older inflaters
    public RBHybridWebView(Context context, AttributeSet attrs, int defStyleAttr, int defStyleRes) {
        super(context, attrs, defStyleAttr, defStyleRes);
        init();
    }

    private void init() {
        // No-op: acts as a normal WebView on api15
    }
}

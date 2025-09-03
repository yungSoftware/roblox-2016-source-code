package com.roblox.client;

import android.annotation.SuppressLint;
import android.content.Context;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * Bridge exposed to JS as window.__globalRobloxAndroidBridge__
 * Receives JSON commands from RobloxHybrid and can route them to native code.
 */
public class RobloxAndroidBridge {
    private static final String TAG = "RobloxAndroidBridge";

    private final Context context;
    private final WebView webView;

    public RobloxAndroidBridge(Context context, WebView webView) {
        this.context = context;
        this.webView = webView;
    }

    @SuppressLint("JavascriptInterface")
    @JavascriptInterface
    public void executeRoblox(String json) {
        try {
            JSONObject obj = new JSONObject(json);
            String moduleId = obj.optString("moduleID");
            String functionName = obj.optString("functionName");
            JSONObject params = obj.optJSONObject("params");
            String callbackID = obj.optString("callbackID");

            Log.i(TAG, "JS -> Native: module=" + moduleId + ", func=" + functionName + ", params=" + (params != null ? params.toString() : "{}"));

            // Minimal no-op dispatcher. Add routing to native functionality as needed.
            // For now, immediately callback success so JS continues gracefully.
            nativeCallback(callbackID, 0 /* SUCCESS */, new JSONObject());
        } catch (JSONException e) {
            Log.w(TAG, "Failed parsing Hybrid bridge payload: " + json, e);
        }
    }

    private void nativeCallback(final String callbackID, final int status, final JSONObject payload) {
        if (callbackID == null || callbackID.isEmpty()) return;
        final String js = String.format(
                "javascript:try{require('Bridge/Native').nativeCallback('%s', %d, %s)}catch(e){console&&console.log(e)}",
                escapeJs(callbackID), status, payload != null ? escapeJson(payload.toString()) : "{}"
        );
        webView.post(new Runnable() {
            @Override public void run() { webView.loadUrl(js); }
        });
    }

    private static String escapeJs(String s) {
        return s.replace("\\", "\\\\").replace("'", "\\'");
    }

    private static String escapeJson(String s) {
        // Wrap raw JSON string so it is valid inside the JS call
        return s;
    }
}

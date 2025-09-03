package com.android.vending.billing;

import android.app.PendingIntent;
import android.os.Binder;
import android.os.Bundle;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

/**
 * Minimal compile-time stub of the In-app Billing V3 service interface.
 * This is provided to satisfy legacy code compilation on api15 builds
 * when AIDL codegen is unavailable. Not intended for runtime use.
 */
public interface IInAppBillingService extends IInterface {
    int isBillingSupported(int apiVersion, String packageName, String type) throws RemoteException;
    Bundle getSkuDetails(int apiVersion, String packageName, String type, Bundle skusBundle) throws RemoteException;
    Bundle getBuyIntent(int apiVersion, String packageName, String sku, String type, String developerPayload) throws RemoteException;
    Bundle getPurchases(int apiVersion, String packageName, String type, String continuationToken) throws RemoteException;
    int consumePurchase(int apiVersion, String packageName, String purchaseToken) throws RemoteException;

    abstract class Stub extends Binder implements IInAppBillingService {
        private static final String DESCRIPTOR = "com.android.vending.billing.IInAppBillingService";

        public Stub() {
            this.attachInterface(this, DESCRIPTOR);
        }

        public static IInAppBillingService asInterface(IBinder obj) {
            if (obj == null) return null;
            IInterface iin = obj.queryLocalInterface(DESCRIPTOR);
            if (iin != null && iin instanceof IInAppBillingService) {
                return (IInAppBillingService) iin;
            }
            return new Proxy(obj);
        }

        @Override
        public IBinder asBinder() {
            return this;
        }

        @Override
        protected boolean onTransact(int code, Parcel data, Parcel reply, int flags) throws RemoteException {
            // Minimal no-op implementation; not used at runtime for api15 build
            return super.onTransact(code, data, reply, flags);
        }

        private static class Proxy implements IInAppBillingService {
            private IBinder mRemote;

            Proxy(IBinder remote) {
                mRemote = remote;
            }

            @Override
            public IBinder asBinder() {
                return mRemote;
            }

            public String getInterfaceDescriptor() {
                return DESCRIPTOR;
            }

            @Override
            public int isBillingSupported(int apiVersion, String packageName, String type) throws RemoteException {
                // Return billing unavailable in minimal stub
                return 3; // BILLING_RESPONSE_RESULT_BILLING_UNAVAILABLE
            }

            @Override
            public Bundle getSkuDetails(int apiVersion, String packageName, String type, Bundle skusBundle) throws RemoteException {
                return new Bundle();
            }

            @Override
            public Bundle getBuyIntent(int apiVersion, String packageName, String sku, String type, String developerPayload) throws RemoteException {
                Bundle b = new Bundle();
                b.putParcelable("BUY_INTENT", (PendingIntent) null);
                return b;
            }

            @Override
            public Bundle getPurchases(int apiVersion, String packageName, String type, String continuationToken) throws RemoteException {
                return new Bundle();
            }

            @Override
            public int consumePurchase(int apiVersion, String packageName, String purchaseToken) throws RemoteException {
                return 6; // RESULT_ERROR default
            }
        }
    }
}

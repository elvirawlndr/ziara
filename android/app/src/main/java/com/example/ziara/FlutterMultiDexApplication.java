package com.example.ziara;

import androidx.multidex.MultiDex;
import androidx.multidex.MultiDexApplication;

public class FlutterMultiDexApplication extends MultiDexApplication {
    @Override
    public void onCreate() {
        super.onCreate();
        MultiDex.install(this);
    }
}

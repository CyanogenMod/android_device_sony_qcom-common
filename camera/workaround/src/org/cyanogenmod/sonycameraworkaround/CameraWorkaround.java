/*
 * Copyright (C) 2014 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.cyanogenmod.sonycameraworkaround;

import android.hardware.Camera;
import android.os.Bundle;
import android.app.Activity;
import android.os.Handler;
import android.util.Log;

public class CameraWorkaround extends Activity {

    private static final String LOG_TAG = "CameraWorkaround";
    private static final int CAMERA_TIMEOUT = 5000;

    private Camera mCamera;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        try {
            mCamera = Camera.open();
            new Handler().postDelayed(new Runnable() {
                @Override
                public void run() {
                    if (mCamera != null) {
                        mCamera.release();
                        mCamera = null;
                    }
                    finishCameraWorkaround();
                }
            }, CAMERA_TIMEOUT);
        } catch (Exception e) {
            Log.e(LOG_TAG, "failed to open Camera", e);
            finishCameraWorkaround();
        }
    }

    @Override
    public void onPause() {
        super.onPause();

        if (mCamera != null) {
            mCamera.release();
            mCamera = null;
        }
    }

    private void finishCameraWorkaround() {
        finish();
    }
}

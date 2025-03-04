package com.example.citywatch // Ensure this matches your package name

import android.content.Context
import android.content.SharedPreferences
import android.content.pm.ApplicationInfo
import android.os.Bundle
import com.google.firebase.FirebaseApp
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val isDebuggable = (applicationInfo.flags and ApplicationInfo.FLAG_DEBUGGABLE) != 0

        if (isDebuggable) { // Check if the app is in debug mode
            val firebaseApp = FirebaseApp.getInstance() // Get Firebase instance

            val prefs: SharedPreferences = getSharedPreferences(
                "com.google.firebase.appcheck.debug.store.${firebaseApp.persistenceKey}",
                Context.MODE_PRIVATE
            )

            prefs.edit()
                .putString(
                    "com.google.firebase.appcheck.debug.DEBUG_SECRET",
                    "54CD1664-1870-4FC4-B1CC-A1A4A4B49585"
                )
                .apply()
        }
    }
}

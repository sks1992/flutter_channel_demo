package com.example.method_channels_flutter

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "SKS"
    private lateinit var channel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        channel.setMethodCallHandler { call, _ ->

            var argument =call.arguments<Map<String,String>>()
            var message = argument?.get("msg")

            if (call.method == "showToast") {
                Toast.makeText(context, message, Toast.LENGTH_SHORT).show()
            }
        }
    }

}

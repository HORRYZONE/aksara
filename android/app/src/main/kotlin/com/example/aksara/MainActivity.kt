package com.example.aksara

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "com.elyasasmad.aksara/tensorflow";

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler {
                call, result ->
                if (call.method == "launchTensorFlowActivity") {
                    launchTensorFlowActivity()
                    result.success(true)
                }
                else {
                    result.notImplemented()
                }
            }
    }

    private fun launchTensorFlowActivity() {
        val intent = Intent(this, TensorActivity::class.java)
        startActivity(intent)
    }
    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
    }
}

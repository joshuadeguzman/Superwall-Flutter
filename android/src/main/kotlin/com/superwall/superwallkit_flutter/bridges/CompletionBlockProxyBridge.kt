package com.superwall.superwallkit_flutter.bridges

import com.superwall.superwallkit_flutter.invokeMethodOnMain
import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding
import io.flutter.plugin.common.MethodChannel

class CompletionBlockProxyBridge(channel: MethodChannel, flutterPluginBinding: FlutterPluginBinding) : BaseBridge(channel, flutterPluginBinding) {

    fun callCompletionBlock(value: Any? = null) {
        channel.invokeMethodOnMain("callCompletionBlock", value)
    }
}

package io.flutter.plugins

import io.flutter.plugin.common.PluginRegistry
import com.pichillilorenzo.flutter_inappbrowser.InAppBrowserFlutterPlugin
import com.flutter_webview_plugin.FlutterWebviewPlugin
import io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin

/**
 * Generated file. Do not edit.
 */
object GeneratedPluginRegistrant {
    fun registerWith(registry: PluginRegistry) {
        if (alreadyRegisteredWith(registry)) {
            return
        }
        InAppBrowserFlutterPlugin.registerWith(registry.registrarFor("com.pichillilorenzo.flutter_inappbrowser.InAppBrowserFlutterPlugin"))
        FlutterWebviewPlugin.registerWith(registry.registrarFor("com.flutter_webview_plugin.FlutterWebviewPlugin"))
        FluttertoastPlugin.registerWith(registry.registrarFor("io.github.ponnamkarthik.toast.fluttertoast.FluttertoastPlugin"))
        WebViewFlutterPlugin.registerWith(registry.registrarFor("io.flutter.plugins.webviewflutter.WebViewFlutterPlugin"))
    }

    private fun alreadyRegisteredWith(registry: PluginRegistry): Boolean {
        val key = GeneratedPluginRegistrant::class.java.canonicalName
        if (registry.hasPlugin(key)) {
            return true
        }
        registry.registrarFor(key)
        return false
    }
}

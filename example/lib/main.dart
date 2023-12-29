import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:superwallkit_flutter/superwallkit_flutter.dart';
import 'package:superwallkit_flutter_example/RCPurchaseController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> implements SuperwallDelegate {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    bool useRevenueCat = true;

    super.initState();
    configureSuperwall(useRevenueCat);
    initPlatformState();
  }

  // Configure Superwall
  Future<void> configureSuperwall(bool useRevenueCat) async {
    try {
      // MARK: Step 1 - Create your Purchase Controller
      /// Create an `RCPurchaseController()` wherever Superwall and RevenueCat are being initialized.
      RCPurchaseController purchaseController = RCPurchaseController();

      // Get Superwall API Key
      String apiKey = Platform.isIOS ? "pk_5f6d9ae96b889bc2c36ca0f2368de2c4c3d5f6119aacd3d2" : "pk_d1f0959f70c761b1d55bb774a03e22b2b6ed290ce6561f85";

      // MARK: Step 2 - Configure Superwall
      /// Always configure Superwall first. Pass in the `purchaseController` you just created.
      await Superwall.configure(
          apiKey,
          purchaseController: useRevenueCat ? purchaseController : null
      );

      Superwall.shared.setDelegate(this);

      // MARK: Step 3 – Configure RevenueCat and Sync Subscription Status
      /// Always configure RevenueCat after Superwall and keep Superwall's
      /// subscription status up-to-date with RevenueCat's.
      if (useRevenueCat) {
        await purchaseController.configureAndSyncSubscriptionStatus();
      }

    } catch (e) {
      // Handle any errors that occur during configuration
      print('Failed to configure Superwall: $e');
    }
  }


  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // Method to call when the button is tapped
  Future<void> onRegisterTapped() async {
    try {
      PaywallPresentationHandler handler = PaywallPresentationHandler();
      handler.onPresent((paywallInfo) {
        print("Handler (onPresent): ${paywallInfo.name}");
      });
      handler.onDismiss((paywallInfo) {
        print("Handler (onDismiss): ${paywallInfo.name}");
      });
      handler.onError((error) {
        print("Handler (onError): ${error}");
      });
      handler.onSkip((skipReason) {
        print("Handler (onSkip): ${skipReason}");
      });

      await Superwall.shared.registerEvent(
        'flutter',
        params: null,
        handler: handler,
        feature: () {
          print("Executing feature block");
        }
      );
      print('Register method called successfully.');
    } catch (e) {
      // Handle any errors that occur during registration
      print('Failed to call register method: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter superapp'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Running'),
              ElevatedButton(
                onPressed: onRegisterTapped,
                child: const Text('Register event'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didDismissPaywall(PaywallInfo paywallInfo) {
    print("didDismissPaywall: " + paywallInfo.toString());
  }

  @override
  void didPresentPaywall(PaywallInfo paywallInfo) {
    print("didPresentPaywall: " + paywallInfo.toString());
  }

  @override
  void handleCustomPaywallAction(String name) {
    print("handleCustomPaywallAction: " + name.toString());
  }

  @override
  void handleLog(String level, String scope, String? message, Map<String, dynamic>? info, String error) {
    // TODO: implement handleLog
  }

  @override
  void handleSuperwallEvent(SuperwallEventInfo eventInfo) {
    print("handleSuperwallEvent: " + eventInfo.toString());
  }

  @override
  void paywallWillOpenDeepLink(Uri url) {
    print("paywallWillOpenDeepLink: " + url.toString());
  }

  @override
  void paywallWillOpenURL(Uri url) {
    print("paywallWillOpenURL: " + url.toString());
  }

  @override
  void subscriptionStatusDidChange(SubscriptionStatus newValue) {
    print("subscriptionStatusDidChange: " + newValue.toString());
  }

  @override
  void willDismissPaywall(PaywallInfo paywallInfo) {
    print("willDismissPaywall: " + paywallInfo.toString());
  }

  @override
  void willPresentPaywall(PaywallInfo paywallInfo) {
    printSubscriptionStatus();
    print("willPresentPaywall: " + paywallInfo.toString());
  }

  void printSubscriptionStatus() async {
    final status = await Superwall.shared.getSubscriptionStatus();
    final description = await status.description;

    print("Status: " + description);
  }
}

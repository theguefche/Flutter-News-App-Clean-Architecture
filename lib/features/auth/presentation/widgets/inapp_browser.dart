import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';

//try using chrome safari browser
class CustomInAppBrowser extends InAppBrowser {



  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onReceivedError(WebResourceRequest request, WebResourceError error) {
    print("Can't load ${request.url}.. Error: ${error.description}");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}

class Oauth2HandlersX {
  final WebUri request;


  Oauth2HandlersX({required this.request});

  Future<void> openInAppBrowser() async {
    await CustomInAppBrowser().openUrlRequest(
        urlRequest: URLRequest(url: request),
        settings: InAppBrowserClassSettings(
            browserSettings: InAppBrowserSettings(
                allowGoBackWithBackButton: true,
                hideCloseButton: false,
                closeButtonCaption: 'close',
                shouldCloseOnBackButtonPressed: true,
                closeButtonColor: Colors.red
                
                ),
            webViewSettings: InAppWebViewSettings(
              
                userAgent: "random",
                useHybridComposition: true,
                sharedCookiesEnabled: true)));
  }

  Future<void> open() async {
    await ChromeSafariBrowser().open(
      url: WebUri('facebook.com'),
    );
  }
}

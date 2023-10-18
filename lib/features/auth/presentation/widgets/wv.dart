import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';

@RoutePage()
class Oauth2Handler extends StatelessWidget {
  WebViewCookieManager cookieManager = WebViewCookieManager();

  final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setUserAgent("random")
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) async {
      
        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(GOOGLE_AUTH_URL);

  Oauth2Handler({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: WebViewWidget(controller: controller),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final cookies = await controller.runJavaScriptReturningResult(
            'document.cookie',
          );
          debugPrint(cookies.toString());
        },
        child: const Icon(Icons.web_outlined),
      ),
    );
  }
}

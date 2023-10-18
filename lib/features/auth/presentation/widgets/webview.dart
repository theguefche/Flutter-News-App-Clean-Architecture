import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:news_app_clean_architecture/core/constants/constants.dart';
import 'package:news_app_clean_architecture/main.dart';

@RoutePage()
class Oauth2HandlerX extends StatefulWidget {
  const Oauth2HandlerX({super.key});

  @override
  State<Oauth2HandlerX> createState() => _Oauth2HandlerXState();
}

class _Oauth2HandlerXState extends State<Oauth2HandlerX> {
  CookieManager cookieManager = CookieManager.instance();
  InAppWebViewController? webViewController;
  final GlobalKey webViewKey = GlobalKey();
  double progress = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          progress < 1.0
              ? LinearProgressIndicator(
                  value: progress,
                )
              : Container(),
          Expanded(
            // Use Expanded inside the Column
            child: InAppWebView(
              // key: webViewKey,
              initialSettings: InAppWebViewSettings(

                  javaScriptEnabled: true,
                  useHybridComposition: true,
                  userAgent: "random",
                  sharedCookiesEnabled: true),
              initialUrlRequest: URLRequest(url: GOOGLE_AUTH_URL),
              onLoadStart: (controller, url) async {
                debugPrint("go go go");
                if (url.toString().contains("com.myapp://")) {
                  Cookie? cookie = await cookieManager.getCookie(
                      url: GOOGLE_AUTH_URL, name: "email");
                  List<Cookie> cookies =
                      await cookieManager.getCookies(url: GOOGLE_AUTH_URL);
                  debugPrint(cookies.toString());
                  List<Cookie> cookieDataList = cookies.map((cookie) {
                    return Cookie(
                      name: cookie.name,
                      value: cookie.value,
                      domain: cookie.domain,
                      path: cookie.path,
                      expiresDate: cookie.expiresDate,
                      isHttpOnly: cookie.isHttpOnly,
                      isSecure: cookie.isSecure,
                    );
                  }).toList();

                  final c = await cookieJar.loadForRequest(GOOGLE_AUTH_URL);
                  
                  debugPrint(c.last.value);
                  cookieJar.storage.read("email").then((value) => debugPrint(value));


                  Map<String, Map<String, Map<String, SerializableCookie>>> k =
                      cookieJar.hostCookies;
                  final m = k.entries.first.value;

                  debugPrint(m.length.toString());
                  debugPrint(m.keys.first);

                  debugPrint(m.runtimeType.toString());

                  // k.forEach(
                  //   (key, value) => {
                  //     debugPrint(value.runtimeType.toString()),
                  //     debugPrint(value.keys.first.toString()),
                  //     debugPrint(value.keys.toString()),
                  //     debugPrint(value),
                  //   },
                  // );
                  // debugPrint("asdasd");
                  // debugPrint(cookieJar.hostCookies.length.toString());
                  // printNestedMap(k);
                  // printNestedMap(cookieJar.domainCookies);

                  // debugPrint(cookieJar.hostCookies.entries.first.value.entries
                  //     .first.value.entries.first.value.cookie
                  //     .toString());

                  // cookies.map((cookie) =>
                  //     {cookieJar.storage.write(cookie.name, cookie.value)});
                  // debugPrint(cookies.toString());

                  // Navigator.of(context).pop();
                }
              },
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
  
              onProgressChanged: (controller, progress) {
                debugPrint(progress.toString());
                setState(() {
                  this.progress = progress / 100;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

void printNestedMap(
    Map<String, Map<String, Map<String, SerializableCookie>>> data) {
  // data.forEach((key, value) {
  //   debugPrint("Key: $key");
  //   for (var element in value.entries) {
  //     debugPrint(element.key);
  //   }});

  debugPrint(data.length.toString());
  data.forEach((key, value) {
    debugPrint(key);
  });
}

List<SerializableCookie> mapOverNestedMaps(
    Map<String, Map<String, Map<String, SerializableCookie>>> data) {
  List<SerializableCookie> allCookies = [];

  void traverse(Map<String, Map<String, SerializableCookie>> map) {
    map.forEach((host, innerMap) {
      innerMap.forEach((subKey, subValue) {
        allCookies.add(subValue);
      });
    });
  }

  data.forEach((host, innerMap) {
    traverse(innerMap);
  });

  return allCookies;
}

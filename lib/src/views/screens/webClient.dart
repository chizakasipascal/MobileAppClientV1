import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:url_launcher/url_launcher.dart';

class WebClient extends StatefulWidget {
  @override
  _WebClientState createState() => _WebClientState();
}

class _WebClientState extends State<WebClient> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(title: const Text("Web Message Channels")),
          body: SafeArea(
              child: Column(children: <Widget>[
            Expanded(
              child: InAppWebView(
                initialData: InAppWebViewInitialData(data: """
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WebMessageChannel Test</title>
</head>
<body>
    <!-- when you click this button, it will send a message to the Dart side -->
    <button id="button" onclick="port.postMessage(input.value);" />Send</button>
    <br />
    <input id="input" type="text" value="JavaScript To Native" />
    
    <script>
      // variable that will represents the port used to communicate with the Dart side
      var port;
      // listen for messages
      window.addEventListener('message', function(event) {
          if (event.data == 'capturePort') {
              // capture port2 coming from the Dart side
              if (event.ports[0] != null) {
                  // the port is ready for communication,
                  // so you can use port.postMessage(message); wherever you want
                  port = event.ports[0];
                  // To listen to messages coming from the Dart side, set the onmessage event listener
                  port.onmessage = function (event) {
                      // event.data contains the message data coming from the Dart side 
                      console.log(event.data);
                  };
              }
          }
      }, false);
    </script>
</body>
</html>
"""),
                initialOptions: options,
                onConsoleMessage: (controller, consoleMessage) {
                  print(
                      "Message coming from the Dart side: ${consoleMessage.message}");
                },
                onLoadStop: (controller, url) async {
                  if (!Platform.isAndroid ||
                      await AndroidWebViewFeature.isFeatureSupported(
                          AndroidWebViewFeature.CREATE_WEB_MESSAGE_CHANNEL)) {
                    // wait until the page is loaded, and then create the Web Message Channel
                    var webMessageChannel =
                        await controller.createWebMessageChannel();
                    var port1 = webMessageChannel!.port1;
                    var port2 = webMessageChannel.port2;

                    // set the web message callback for the port1
                    await port1.setWebMessageCallback((message) async {
                      print(
                          "Message coming from the JavaScript side: $message");
                      // when it receives a message from the JavaScript side, respond back with another message.
                      await port1.postMessage(
                          WebMessage(data: message! + " and back"));
                    });

                    // transfer port2 to the webpage to initialize the communication
                    await controller.postWebMessage(
                        message:
                            WebMessage(data: "capturePort", ports: [port2]),
                        targetOrigin: Uri.parse("*"));
                  }
                },
              ),
            ),
          ]))),
    );
  }
}
//   InAppWebViewController? webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));

//   late PullToRefreshController pullToRefreshController;
//   String url = "";
//   double progress = 0;
//   final urlController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();

//     pullToRefreshController = PullToRefreshController(
//       options: PullToRefreshOptions(
//         color: kConnectis,
//       ),
//       onRefresh: () async {
//         if (Platform.isAndroid) {
//           webViewController?.reload();
//         } else if (Platform.isIOS) {
//           webViewController?.loadUrl(
//             urlRequest: URLRequest(
//               url: await webViewController?.getUrl(),
//             ),
//           );
//         }
//       },
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           InAppWebView(
//             key: webViewKey,
//             initialUrlRequest: URLRequest(
//               url: Uri.parse("https://connectis.co/p"),
//             ),
//             initialOptions: options,
//             pullToRefreshController: pullToRefreshController,
//             onWebViewCreated: (controller) {
//               webViewController = controller;

//               controller.addJavaScriptHandler(
//                   handlerName: 'handleSubmit()',
//                   callback: (args) {
//                     // print arguments coming from the JavaScript side!
//                     debugPrint("debut code ==================>");
//                     print(args);
//                     return {'bar': 'bar_value', 'baz': 'baz_value'};
//                   });
//             },
//             onLoadStart: (controller, url) {
//               setState(() {
//                 this.url = url.toString();
//                 urlController.text = this.url;
//               });
//             },
//             androidOnPermissionRequest: (controller, origin, resources) async {
//               return PermissionRequestResponse(
//                 resources: resources,
//                 action: PermissionRequestResponseAction.GRANT,
//               );
//             },
//             shouldOverrideUrlLoading: (controller, navigationAction) async {
//               var uri = navigationAction.request.url!;

//               return NavigationActionPolicy.ALLOW;
//             },
//             onLoadStop: (controller, url) async {
//               pullToRefreshController.endRefreshing();
//               setState(() {
//                 this.url = url.toString();
//                 urlController.text = this.url;
//               });
//             },
//             onLoadError: (controller, url, code, message) {
//               pullToRefreshController.endRefreshing();
//             },
//             onProgressChanged: (controller, progress) {
//               if (progress == 100) {
//                 pullToRefreshController.endRefreshing();
//               }
//               setState(() {
//                 this.progress = progress / 100;
//                 urlController.text = url;
//               });
//             },
//             onUpdateVisitedHistory: (controller, url, androidIsReload) {
//               setState(() {
//                 this.url = url.toString();
//                 urlController.text = this.url;
//               });
//             },
//             onConsoleMessage: (controller, consoleMessage) {
//               print(consoleMessage);
//             },
//           ),
//           progress < 1.0
//               ? LinearProgressIndicator(
//                   value: progress,
//                   backgroundColor: kGreyColorOpacity,
//                   color: kConnectis,
//                 )
//               : Container(),
//           Positioned(
//             right: 10,
//             top: 50,
//             child: IconButton(
//               onPressed: () {
//                 webViewController?.reload();
//               },
//               icon: const Icon(
//                 Icons.refresh,
//                 color: kWhiteColor,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

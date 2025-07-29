import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_vibe_app/core/services/app_build_service.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewScreen extends StatelessWidget {
  final String code;

  const PreviewScreen({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Preview'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.download_circle),
          onPressed: () async {
            final url = await AppBuildService().buildApp(code);
            if (await canLaunch(url)) {
              await launch(url);
            }
          },
        ),
      ),
      child: InAppWebView(
        initialData: InAppWebViewInitialData(data: """
          <html>
            <head>
              <style>
                body {
                  display: flex;
                  justify-content: center;
                  align-items: center;
                  height: 100vh;
                  margin: 0;
                }
              </style>
            </head>
            <body>
              <iframe
                src="data:text/html;base64,${base64Encode(code.codeUnits)}"
                width="100%"
                height="100%"
                frameborder="0"
              ></iframe>
            </body>
          </html>
        """),
      ),
    );
  }
}

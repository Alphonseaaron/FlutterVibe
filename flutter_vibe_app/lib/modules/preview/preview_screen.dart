import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_vibe_app/core/services/app_build_service.dart';
import 'package:flutter_vibe_app/core/services/project_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class PreviewScreen extends StatelessWidget {
  final String code;
  final String prompt;

  const PreviewScreen({super.key, required this.code, required this.prompt});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Preview'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.download_circle),
              onPressed: () async {
                final urls = await AppBuildService().buildApp(code);
                _showDownloadDialog(context, urls);
              },
            ),
            CupertinoButton(
              padding: EdgeInsets.zero,
              child: const Icon(CupertinoIcons.add),
              onPressed: () {
                _showSaveDialog(context);
              },
            ),
          ],
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

  void _showDownloadDialog(
      BuildContext context, Map<String, String> urls) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          title: const Text('Download'),
          actions: [
            CupertinoActionSheetAction(
              child: const Text('Android (APK)'),
              onPressed: () async {
                if (await canLaunch(urls['apk']!)) {
                  await launch(urls['apk']!);
                }
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('iOS (IPA)'),
              onPressed: () async {
                if (await canLaunch(urls['ipa']!)) {
                  await launch(urls['ipa']!);
                }
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: const Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        );
      },
    );
  }

  void _showSaveDialog(BuildContext context) {
    final nameController = TextEditingController();
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('Save Project'),
          content: CupertinoTextField(
            controller: nameController,
            placeholder: 'Project Name',
          ),
          actions: [
            CupertinoDialogAction(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CupertinoDialogAction(
              child: const Text('Save'),
              onPressed: () {
                Provider.of<ProjectService>(context, listen: false).saveProject(
                  Project()
                    ..name = nameController.text
                    ..prompt = prompt
                    ..code = code,
                );
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

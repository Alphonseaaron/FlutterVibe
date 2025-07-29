import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/file_upload_service.dart';
import 'package:provider/provider.dart';

class FileUploadProgress extends StatelessWidget {
  const FileUploadProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FileUploadService>(
      builder: (context, fileUploadService, _) {
        return Column(
          children: [
            CupertinoButton(
              child: const Text('Upload File'),
              onPressed: () {
                fileUploadService.uploadFile();
              },
            ),
            if (fileUploadService.progress > 0)
              CupertinoActivityIndicator(
                radius: 20,
              ),
            if (fileUploadService.progress > 0)
              Text('${(fileUploadService.progress * 100).toStringAsFixed(0)}%'),
          ],
        );
      },
    );
  }
}

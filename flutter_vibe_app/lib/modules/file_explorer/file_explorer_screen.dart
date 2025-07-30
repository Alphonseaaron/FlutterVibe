import 'package:flutter/cupertino.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_vibe_app/core/services/project_service.dart';
import 'package:provider/provider.dart';
import 'file_explorer_controller.dart';

class FileExplorerScreen extends StatelessWidget {
  final Project project;

  const FileExplorerScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FileExplorerController(project),
      child: Consumer<FileExplorerController>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text(project.name),
            ),
            child: CodeEditor(
              model: controller.model,
              formatters: const ['dart'],
            ),
          );
        },
      ),
    );
  }
}

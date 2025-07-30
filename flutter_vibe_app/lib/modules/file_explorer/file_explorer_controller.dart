import 'package:flutter/cupertino.dart';
import 'package:flutter_code_editor/flutter_code_editor.dart';
import 'package:flutter_vibe_app/core/services/project_service.dart';

class FileExplorerController extends ChangeNotifier {
  final Project project;
  late final CodeController model;

  FileExplorerController(this.project) {
    model = CodeController(
      text: project.code,
      language: 'dart',
    );
  }
}

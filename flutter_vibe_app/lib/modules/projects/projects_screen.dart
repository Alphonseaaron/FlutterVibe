import 'package:flutter/cupertino.dart';
import 'package:flutter_vibe_app/core/services/project_service.dart';
import 'package:flutter_vibe_app/modules/file_explorer/file_explorer_screen.dart';
import 'package:provider/provider.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Projects'),
      ),
      child: Consumer<ProjectService>(
        builder: (context, projectService, child) {
          final projects = projectService.getProjects();
          return ListView.builder(
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return CupertinoListTile(
                title: Text(project.name),
                onTap: () {
                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => FileExplorerScreen(project: project),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

import 'package:hive/hive.dart';

part 'project_service.g.dart';

@HiveType(typeId: 1)
class Project extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String prompt;

  @HiveField(2)
  late String code;
}

class ProjectService {
  late final Box<Project> _box;

  Future<void> init() async {
    Hive.registerAdapter(ProjectAdapter());
    _box = await Hive.openBox<Project>('projects');
  }

  Future<void> saveProject(Project project) async {
    await _box.add(project);
  }

  List<Project> getProjects() {
    return _box.values.toList();
  }
}

import 'dart:io';

void main(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart tools/scaffold.dart <module_name>');
    return;
  }

  final moduleName = args[0];
  final modulePath = 'lib/modules/$moduleName';

  Directory(modulePath).createSync(recursive: true);

  File('$modulePath/${moduleName}_screen.dart').writeAsStringSync('''
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '${moduleName}_controller.dart';

class ${moduleName.capitalize()}Screen extends StatelessWidget {
  const ${moduleName.capitalize()}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ${moduleName.capitalize()}Controller(),
      child: Consumer<${moduleName.capitalize()}Controller>(
        builder: (context, controller, child) {
          return CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('${moduleName.capitalize()}'),
            ),
            child: Center(
              child: Text('${moduleName.capitalize()} Screen'),
            ),
          );
        },
      ),
    );
  }
}
''');

  File('$modulePath/${moduleName}_controller.dart').writeAsStringSync('''
import 'package:flutter/cupertino.dart';

class ${moduleName.capitalize()}Controller extends ChangeNotifier {
  // Add your controller logic here
}
''');

  print('Module $moduleName created successfully.');
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

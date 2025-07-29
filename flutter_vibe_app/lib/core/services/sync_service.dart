import 'package:flutter_vibe_app/data/repositories/sync_repository.dart';
import 'package:workmanager/workmanager.dart';

const syncTask = "syncTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final syncRepository = SyncRepository();
    await syncRepository.sync();
    return Future.value(true);
  });
}

Future<void> initSyncService() async {
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );
  await Workmanager().registerPeriodicTask(
    "1",
    syncTask,
    frequency: const Duration(minutes: 15),
  );
}

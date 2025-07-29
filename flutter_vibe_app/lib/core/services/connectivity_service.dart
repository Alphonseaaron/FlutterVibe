import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum ConnectionStatus { online, offline, slow }

class ConnectivityService extends ChangeNotifier {
  final _connectivity = Connectivity();
  ConnectionStatus _connectionStatus = ConnectionStatus.online;

  ConnectionStatus get connectionStatus => _connectionStatus;

  ConnectivityService() {
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _checkConnection();
  }

  Future<void> _checkConnection() async {
    try {
      final result = await http.get(Uri.parse('https://www.google.com'));
      if (result.statusCode == 200) {
        _connectionStatus = ConnectionStatus.online;
      } else {
        _connectionStatus = ConnectionStatus.offline;
      }
    } catch (_) {
      _connectionStatus = ConnectionStatus.offline;
    }
    notifyListeners();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.none) {
      _connectionStatus = ConnectionStatus.offline;
    } else {
      await _checkConnection();
    }
    notifyListeners();
  }
}

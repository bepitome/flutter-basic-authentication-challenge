import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {

  @observable
  ObservableStream<ConnectivityResult> connectivityStream =
  ObservableStream(Connectivity().onConnectivityChanged);

  Future<ConnectivityResult> checkConnectivity()
  {
    return Connectivity().checkConnectivity();
  }

  void dispose() {}
}
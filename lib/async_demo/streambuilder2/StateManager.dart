import 'dart:async';

import 'package:flutter_speedcode/async_demo/streambuilder2/GlobalState.dart';


class StateManager {
  StreamController<GlobalState> streamController;

  StateManager() {
    streamController = StreamController();
  }

  void dispose() {
    if (streamController != null) {
      streamController.close();
    }
  }


  void loadingDialog() {
    streamController.sink.add(GlobalShowDialogState());
  }
  void loading() {
    streamController.sink.add(GlobalLoadingState());
  }

  void error() {
    streamController.sink.add(GlobalErrorState());
  }

  void content<T>(T t) {
    streamController.sink.add(GlobalContentState<T>(t));
  }
}

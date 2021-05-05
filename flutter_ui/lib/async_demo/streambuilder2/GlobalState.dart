
import 'package:flutter_speedcode/async_demo/bean/film_list.dart';

class GlobalState {}

class GlobalLoadingState extends GlobalState {}

class GlobalErrorState extends GlobalState {}

class GlobalShowDialogState extends GlobalState {}

class GlobalHideDialogState extends GlobalState {}

class GlobalContentState<T> extends GlobalState {
  T t;

  GlobalContentState(this.t);
}


import 'package:flutter_speedcode/async_demo/bean/film_list.dart';

class NetState {}

class NetLoadingState extends NetState {}

class NetErrorState extends NetState {}

class NetShowDialogState extends NetState {}

class NetHideDialogState extends NetState {}

class NetContentState<T> extends NetState {
  T t;

  NetContentState(this.t);
}


import 'package:flutter_speedcode/async_demo/bean/film_list.dart';

class NetState{}


class LoadingState extends NetState{}
class ErrorState extends NetState{}
class ContentState extends NetState{

  film_list film;

  ContentState(this.film);


}

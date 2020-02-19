import 'package:flutter/cupertino.dart';

class BaseModel with ChangeNotifier {
  bool loading = false;

  void loadingg(bool loading) {
    this.loading = loading;
    notifyListeners();
  }
}

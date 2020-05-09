import 'package:flutter/foundation.dart';
import 'package:flutter_arch_demo/base/baseviewmodel.dart';
import 'package:flutter_arch_demo/base/http/base_state.dart';
import 'package:flutter_arch_demo/base/http/http.dart';
import 'package:flutter_arch_demo/common/Urls.dart';
import 'package:flutter_arch_demo/model/theaters_bean.dart';

class TheatersViewModel extends BaseViewModel {
  TheatersBean theatersBean;

  load() {
    state = BaseState.LOADING;
    notifyListeners();

    Http().get(Urls.theaters, {}, success: (json) {
      compute(decode, json).then((value) {
        if (value == null) {
          state = BaseState.EMPTY;
        } else {
          theatersBean = value;
          state = BaseState.CONTENT;
        }
        notifyListeners();
      });
    }, fail: (reason, statuscode) {
      state = BaseState.FAIL;
      notifyListeners();
    }, after: () {});
  }

  static TheatersBean decode(dynamic json) {
    return TheatersBean.fromJson(json);
  }
}

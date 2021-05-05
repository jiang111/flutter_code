import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef HideDialogCallBack = Future Function();

class LoadingDialog {
  static HideDialogCallBack showDialog(BuildContext context) {
    Completer completer = Completer();

    OverlayEntry? result = OverlayEntry(
      maintainState: true,
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              color: Color(0x99f4f4f4),
              width: 150,
              height: 150,
              child: Center(
                child: Text("loading..."),
              ),
            ),
          ),
        );
      },
    );

    completer.complete(() {
      if (result != null) {
        result!.remove();
        result = null;
      }
    });

    Overlay.of(context)!.insert(result!);

    return () async {
      var hide = await completer.future;
      hide();
    };
  }
}

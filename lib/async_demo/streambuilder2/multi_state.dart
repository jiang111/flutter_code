import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_speedcode/async_demo/streambuilder2/NetState.dart';
import 'package:flutter_speedcode/async_demo/widget/error.dart';
import 'package:flutter_speedcode/async_demo/widget/loading.dart';
import 'package:flutter_speedcode/async_demo/widget/loading_dialog.dart';

typedef GlobalContentBuilder<T> = Widget Function(
    BuildContext buildContext, T t);


class MultiStateWidget<T> extends StatefulWidget {
  Widget loading = LoadingWidget();
  Widget error = Error1Widget();

  GlobalContentBuilder contentBuilder;

  StreamController<NetState> streamController;

  MultiStateWidget(
      {this.streamController, this.contentBuilder, this.loading, this.error});

  @override
  _MultiStateWidgetState<T> createState() => _MultiStateWidgetState<T>();
}

class _MultiStateWidgetState<T> extends State<MultiStateWidget> {
  HideDialogCallBack hideDialogCallBack;

  Widget lastWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<NetState>(
        stream: widget.streamController.stream,
        builder: (context, snap) {
          Widget result;
          if (snap.data != null) {
            if (snap.data is NetLoadingState) {
              result = LoadingWidget();
            } else if (snap.data is NetErrorState) {
              hideDialog();
              result = Error1Widget();
            } else if (snap.data is NetShowDialogState) {
              Future.microtask(() {
                hideDialogCallBack = LoadingDialog.showDialog(context);
              });

              if (lastWidget != null) {
                result = lastWidget;
              }
            } else if (snap.data is NetHideDialogState) {
              hideDialog();
              if (lastWidget != null) {
                result = lastWidget;
              }
            } else if (snap.data is NetContentState) {
              hideDialog();
              result = widget.contentBuilder(
                  context, (snap.data as NetContentState).t);
            }
          }

          if (result == null) {
            result = Container(width: 0.0, height: 0.0);
          }

          return lastWidget = result;
        },
      ),
    );
  }

  void hideDialog() {
    if (hideDialogCallBack != null) {
      hideDialogCallBack();
      hideDialogCallBack = null;
    }
  }

  @override
  void dispose() {
    hideDialog();
    super.dispose();
  }
}

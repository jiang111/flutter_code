import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arch_demo/base/http/base_state.dart';
import 'package:flutter_arch_demo/base/textUtils.dart';

typedef Content = Widget Function(BuildContext context);

class MultiStateWidget extends StatefulWidget {
  Widget loadingWidget;
  Widget emptyWidget;
  Widget failWidget;
  Content builder;
  BaseState state;

  MultiStateWidget(
      {Key key,
      Content builder,
      this.state,
      this.emptyWidget,
      this.failWidget,
      this.loadingWidget})
      : super(key: key) {
    if (state == BaseState.CONTENT) {
      if (builder != null) {
        this.builder = builder;
      }
    }
    if (emptyWidget == null) {
      emptyWidget = EmptyStateWidget();
    }

    if (failWidget == null) {
      failWidget = ErrorStateWidget();
    }

    if (loadingWidget == null) {
      loadingWidget = LoadingStateWidget();
    }
  }

  @override
  _MultiStateWidgetState createState() => _MultiStateWidgetState();
}

class _MultiStateWidgetState extends State<MultiStateWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.state == null)
      return Container(
        width: 0,
        height: 0,
      );
    if (widget.state == BaseState.CONTENT) {
      return widget.builder(context);
    } else if (widget.state == BaseState.EMPTY) {
      return widget.emptyWidget;
    } else if (widget.state == BaseState.FAIL) {
      return widget.failWidget;
    } else {
      return widget.loadingWidget;
    }
  }
}

class EmptyStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "暂无数据",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  String reason;

  ErrorStateWidget({this.reason});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          TextUtils.getNonStr(reason, ifNonReplace: "请求失败"),
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

class LoadingStateWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
          "加载中...",
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ),
    );
  }
}

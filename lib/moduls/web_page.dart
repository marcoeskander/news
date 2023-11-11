import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/shared/cuibt/cuibt.dart';
import 'package:news/shared/cuibt/states.dart';
import 'package:news/shared/network/commponent.dart';

class wep_page extends StatelessWidget {
  final String url;
  wep_page({required this.url});
  @override
  Widget build(Object context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}

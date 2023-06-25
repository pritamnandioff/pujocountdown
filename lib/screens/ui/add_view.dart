// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

Widget adsenseAdsView(BuildContext context) {
  // ignore: undefined_prefixed_name
  ui.platformViewRegistry.registerViewFactory(
      'adViewType',
      (int viewID) => IFrameElement()
        ..width = '320'
        ..height = ""
        ..src = 'adview.html'
        ..style.border = 'none');

  return SizedBox(
    height: 50.0,
    width: MediaQuery.of(context).size.width - 100,
    child: HtmlElementView(
      viewType: 'adViewType',
    ),
  );
}

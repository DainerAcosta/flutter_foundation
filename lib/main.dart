import 'package:flutter/material.dart';
import 'package:flutter_template/my_app.dart';
import 'package:flutter_translate/flutter_translate.dart';

void main() async {
  var delegate = await LocalizationDelegate.create(
    fallbackLocale: 'es_ES',
    supportedLocales: ['es_ES'],
  );

  runApp(LocalizedApp(delegate, const MyApp()));
}

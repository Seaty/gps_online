//Temp history Data
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:gps_selling/historyMenu/historyModel.dart';
import 'package:intl/intl.dart';

Future<List<dynamic>> getTempHistory() async {
  String jsonText = await rootBundle.loadString('assets/data/historyData.json');
  List<dynamic> data = json.decode(jsonText);
  return await Future.delayed(const Duration(seconds: 2),
      () => data.map((x) => HistoryData.fromJson(x)).toList());
}

final f = new DateFormat('yyyy-MM-dd HH:mm');

double checkscreenwidth(double meidawidth, double multiply) {
  if (meidawidth > 1100) {
    meidawidth = 1100;
  }
  
  return meidawidth / multiply < 14 ? 14 : meidawidth / multiply;
}



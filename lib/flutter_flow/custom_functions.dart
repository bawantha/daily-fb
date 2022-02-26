import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';

String getUrlFromDIv(String rawData) {
  RegExp exp = RegExp(
      r"https?:\/\/(.+?\.)?scorebat\.com(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=')");
  RegExpMatch matches = exp.firstMatch(rawData);
  return matches.group(0);
}

List<String> getUniqueCompetitionInTime(dynamic dataList) {
  return dataList['response']
      .map((element) {
        return element["key"].toString();
      })
      .toSet()
      .toList();
}

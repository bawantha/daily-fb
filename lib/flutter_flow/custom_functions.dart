import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

String getUrlFromDIv(String rawData) {
  RegExp exp = RegExp(
      r"https?:\/\/(.+?\.)?scorebat\.com(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=')");
  RegExpMatch matches = exp.firstMatch(rawData);
  return matches.group(0);
}

List<String> getUniqueCompetitionInTime(dynamic dataList) {
  // print(dataList['response']);
  // return ["a"];
  List<dynamic> data = dataList['response'];

  List<String> vv = data
      .map((e) {
        return e["competition"].toString();
      })
      .toSet()
      .toList();

  return vv;
}

List<MatchRecord> generateMatchListFromJsonList(dynamic jsonData) {
  return [MatchRecord()];
}

Future<List<Map<String, String>>> generateYoutubeLinks(dynamic rawData) async {
  List<String> urls = [];
  urls.add("https://www.youtube.com/watch?v=41qC3w3UUkU");
  return Future.delayed(
    Duration(seconds: 2),
    () {
      List<Map<String, String>> val = [];
      val.add({"aaa": "https://www.youtube.com/watch?v=41qC3w3UUkU"});
      return val;
    },
  );
}

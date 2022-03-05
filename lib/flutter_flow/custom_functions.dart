import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'package:http/http.dart' as http;
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

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

Future<String> getDataOfUrl(String url) async {
  final res = await http.get(Uri.parse(url));

  return res.body.toString();
}

Future<List<Map<String, String>>> generateYoutubeLinks(dynamic rawData) async {
  List<dynamic> videos = rawData['videos'];
  List<Map<String, String>> data = [];
  final List<String> urls = await Future.wait(
      videos.map((e) async => await _getYTLink(e['embed'])).toList());

  for (int i = 0; i < urls.length; i++) {
    data.add({videos[i]['title'].toString(): urls[i].toString()});
  }

  return data;
}

Future<String> _getYTLink(String data) async {
  String ytLink;
  try {
    String sbURL = data.extractScoreBatURlFromDive();
    if (sbURL != null) {
      final String dataFromScoreBat = await sbURL.getFromURL();
      if (dataFromScoreBat != null) {
        String cloudFronUrl = dataFromScoreBat.extractCloudFrontURlFromDive();
        if (cloudFronUrl != null) {
          final String dataFromCloudFront = await cloudFronUrl.getFromURL();
          if (dataFromCloudFront != null) {
            String yt = dataFromCloudFront.getYTLink();
            if (yt != null) {
              ytLink = yt;
            } else {
              ytLink = null;
            }
          } else {
            ytLink = null;
          }
        } else {
          String link = dataFromScoreBat.exTractuYTLinkDirect();

          ytLink = link;
        }
      } else {
        ytLink = null;
      }
    } else {
      ytLink = null;
    }
  } catch (e) {
    ytLink = null;
  }

  return ytLink;
}

extension StringParsing on String {
  String extractScoreBatURlFromDive() {
    try {
      RegExp exp = RegExp(r"""
https?:\/\/(.+?\.)?scorebat\.com(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=')""");
      RegExpMatch matches = exp.firstMatch(this);
      String url = matches?.group(0);
      return url;
    } catch (e) {
      return null;
    }
  }

  String extractCloudFrontURlFromDive() {
    try {
      RegExp exp = RegExp(
          r"https?:\/\/(.+?\.)?cloudfront\.net(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=')");
      RegExpMatch matches = exp.firstMatch(this);
      String url = matches?.group(0);
      return url;
    } catch (e) {
      return null;
    }
  }

  Future<String> getFromURL() async {
    try {
      return getDataOfUrl(this).then((value) => value);
    } catch (e) {
      return null;
    }
  }

  String getYTLink() {
    try {
      RegExp exp2 = RegExp(
          r"https?:\/\/(.+?\.)?img.youtube\.com(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=\))");
      // RegExp exp = new RegExp(r"'https");
      RegExpMatch matches2 = exp2.firstMatch(this);
      String url2 = matches2.group(0);

      RegExp exp3 = RegExp(r"(vi\/).*(?=\/)");
      RegExpMatch matches3 = exp3.firstMatch(url2);
      String videoID = matches3.group(0).substring(3);
      String yt = "https://youtube.com/watch?v=" + videoID;
      return yt;
    } catch (e) {
      return null;
    }
  }

  String exTractuYTLinkDirect() {
    try {
      RegExp exp2 = RegExp(
          r"https?:\/\/(.+?\.)?img.youtube\.com(\/[A-Za-z0-9\-\._~:\/\?#\[\]@!$&'\(\)\*\+,;\=]*)(?=\))");
      // RegExp exp = new RegExp(r"'https");
      RegExpMatch matches2 = exp2.firstMatch(this);
      String url2 = matches2.group(0);

      RegExp exp3 = RegExp(r"(vi\/).*(?=\/)");
      RegExpMatch matches3 = exp3.firstMatch(url2);
      String videoID = matches3.group(0).substring(3);
      String yt = "https://youtube.com/watch?v=" + videoID;
      return yt;
    } catch (e) {
      return null;
    }
  }
}

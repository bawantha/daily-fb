import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class DailyfbCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'dailyfb',
      apiUrl: 'https://www.scorebat.com/video-api/v3/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic competition(dynamic response) => getJsonField(
        response,
        r'''$.response[:].competition''',
      );
  static dynamic titlle(dynamic response) => getJsonField(
        response,
        r'''$.response[:].title''',
      );
}

class ImageSearchCall {
  static Future<ApiCallResponse> call({
    String q = 'Foot Ball',
    String tbm = 'isch',
    int ijn = 0,
    String apiKey =
        'a2f28adbe9cd7e64d3ae6ad23b89f67d23dfd2c655208d8b23bee6e4a9a52222',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'imageSearch',
      apiUrl: 'https://serpapi.com/search.json',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'q': q,
        'tbm': tbm,
        'ijn': ijn,
        'api_key': apiKey,
      },
      returnBody: true,
    );
  }
}

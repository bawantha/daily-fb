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

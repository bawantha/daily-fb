import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: FutureBuilder<ApiCallResponse>(
            future: DailyfbCall.call(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                  ),
                );
              }
              final columnDailyfbResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final response = getJsonField(
                        (columnDailyfbResponse?.jsonBody ?? ''),
                        r'''$.response''',
                      )?.toList() ??
                      [];
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(response.length, (responseIndex) {
                        final responseItem = response[responseIndex];
                        return Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: BoxDecoration(),
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFF5F5F5),
                              child: Html(
                                data: getJsonField(
                                  responseItem,
                                  r'''$.videos[0].embed''',
                                ).toString(),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

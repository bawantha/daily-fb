import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
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
    return FutureBuilder<ApiCallResponse>(
      future: DailyfbCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        final homePageDailyfbResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: Color(0xFFCFD8DC),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Builder(
                builder: (context) {
                  final competitions = functions
                          .getUniqueCompetitionInTime(
                              (homePageDailyfbResponse?.jsonBody ?? ''))
                          ?.toList() ??
                      [];
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(competitions.length,
                          (competitionsIndex) {
                        final competitionsItem =
                            competitions[competitionsIndex];
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEEEEE),
                          ),
                          child: Text(
                            competitionsItem,
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                        );
                      }),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

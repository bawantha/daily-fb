import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_youtube_player.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({
    Key key,
    this.selectedMatch,
  }) : super(key: key);

  final dynamic selectedMatch;

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 240,
                  child: Stack(
                    alignment: AlignmentDirectional(-0.95, -0.7),
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: Hero(
                          tag: getJsonField(
                            widget.selectedMatch,
                            r'''$.thumbnail''',
                          ),
                          transitionOnUserGestures: true,
                          child: CachedNetworkImage(
                            imageUrl: getJsonField(
                              widget.selectedMatch,
                              r'''$.thumbnail''',
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.3,
                            fit: BoxFit.cover,
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-0.95, -0.55),
                        child: InkWell(
                          onTap: () async {
                            Navigator.pop(context);
                          },
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10, 10, 10, 10),
                              child: Icon(
                                Icons.arrow_back_rounded,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                size: 24,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(),
            child: FutureBuilder(
              future: functions.generateYoutubeLinks(widget.selectedMatch),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Map<String, String>>> snapshot) {
                if (snapshot.hasError) {
                  return Text(
                    'No Video Found :-(',
                  );
                } else if (snapshot.hasData) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(
                        snapshot.data.length,
                        (videoIndex) {
                          final videoItem = snapshot.data[videoIndex];
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.32,
                            decoration: BoxDecoration(),
                            child: Column(
                              children: [
                                Text(
                                  'Hello World',
                                  style: FlutterFlowTheme.of(context).title3,
                                ),
                                Card(
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                  color: Colors.white,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: FlutterFlowYoutubePlayer(
                                    url: videoItem.values.first,
                                    autoPlay: false,
                                    looping: true,
                                    mute: false,
                                    showControls: true,
                                    showFullScreen: true,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                } else {
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
              },
            ),
          ),
        ],
      ),
    );
  }
}

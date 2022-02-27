import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'match_record.g.dart';

abstract class MatchRecord implements Built<MatchRecord, MatchRecordBuilder> {
  static Serializer<MatchRecord> get serializer => _$matchRecordSerializer;

  @nullable
  String get title;

  @nullable
  String get competition;

  @nullable
  String get t1;

  @nullable
  String get t2;

  @nullable
  String get thumbnail;

  @nullable
  DateTime get date;

  @nullable
  BuiltList<DocumentReference> get videos;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(MatchRecordBuilder builder) => builder
    ..title = ''
    ..competition = ''
    ..t1 = ''
    ..t2 = ''
    ..thumbnail = ''
    ..videos = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('match');

  static Stream<MatchRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<MatchRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  MatchRecord._();
  factory MatchRecord([void Function(MatchRecordBuilder) updates]) =
      _$MatchRecord;

  static MatchRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createMatchRecordData({
  String title,
  String competition,
  String t1,
  String t2,
  String thumbnail,
  DateTime date,
}) =>
    serializers.toFirestore(
        MatchRecord.serializer,
        MatchRecord((m) => m
          ..title = title
          ..competition = competition
          ..t1 = t1
          ..t2 = t2
          ..thumbnail = thumbnail
          ..date = date
          ..videos = null));

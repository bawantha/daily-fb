// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MatchRecord> _$matchRecordSerializer = new _$MatchRecordSerializer();

class _$MatchRecordSerializer implements StructuredSerializer<MatchRecord> {
  @override
  final Iterable<Type> types = const [MatchRecord, _$MatchRecord];
  @override
  final String wireName = 'MatchRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, MatchRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.competition;
    if (value != null) {
      result
        ..add('competition')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.t1;
    if (value != null) {
      result
        ..add('t1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.t2;
    if (value != null) {
      result
        ..add('t2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumbnail;
    if (value != null) {
      result
        ..add('thumbnail')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.videos;
    if (value != null) {
      result
        ..add('videos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  MatchRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MatchRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'competition':
          result.competition = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 't1':
          result.t1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 't2':
          result.t2 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'thumbnail':
          result.thumbnail = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'videos':
          result.videos.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$MatchRecord extends MatchRecord {
  @override
  final String title;
  @override
  final String competition;
  @override
  final String t1;
  @override
  final String t2;
  @override
  final String thumbnail;
  @override
  final DateTime date;
  @override
  final BuiltList<DocumentReference<Object>> videos;
  @override
  final DocumentReference<Object> reference;

  factory _$MatchRecord([void Function(MatchRecordBuilder) updates]) =>
      (new MatchRecordBuilder()..update(updates)).build();

  _$MatchRecord._(
      {this.title,
      this.competition,
      this.t1,
      this.t2,
      this.thumbnail,
      this.date,
      this.videos,
      this.reference})
      : super._();

  @override
  MatchRecord rebuild(void Function(MatchRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MatchRecordBuilder toBuilder() => new MatchRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MatchRecord &&
        title == other.title &&
        competition == other.competition &&
        t1 == other.t1 &&
        t2 == other.t2 &&
        thumbnail == other.thumbnail &&
        date == other.date &&
        videos == other.videos &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, title.hashCode), competition.hashCode),
                            t1.hashCode),
                        t2.hashCode),
                    thumbnail.hashCode),
                date.hashCode),
            videos.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('MatchRecord')
          ..add('title', title)
          ..add('competition', competition)
          ..add('t1', t1)
          ..add('t2', t2)
          ..add('thumbnail', thumbnail)
          ..add('date', date)
          ..add('videos', videos)
          ..add('reference', reference))
        .toString();
  }
}

class MatchRecordBuilder implements Builder<MatchRecord, MatchRecordBuilder> {
  _$MatchRecord _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _competition;
  String get competition => _$this._competition;
  set competition(String competition) => _$this._competition = competition;

  String _t1;
  String get t1 => _$this._t1;
  set t1(String t1) => _$this._t1 = t1;

  String _t2;
  String get t2 => _$this._t2;
  set t2(String t2) => _$this._t2 = t2;

  String _thumbnail;
  String get thumbnail => _$this._thumbnail;
  set thumbnail(String thumbnail) => _$this._thumbnail = thumbnail;

  DateTime _date;
  DateTime get date => _$this._date;
  set date(DateTime date) => _$this._date = date;

  ListBuilder<DocumentReference<Object>> _videos;
  ListBuilder<DocumentReference<Object>> get videos =>
      _$this._videos ??= new ListBuilder<DocumentReference<Object>>();
  set videos(ListBuilder<DocumentReference<Object>> videos) =>
      _$this._videos = videos;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  MatchRecordBuilder() {
    MatchRecord._initializeBuilder(this);
  }

  MatchRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _competition = $v.competition;
      _t1 = $v.t1;
      _t2 = $v.t2;
      _thumbnail = $v.thumbnail;
      _date = $v.date;
      _videos = $v.videos?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MatchRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MatchRecord;
  }

  @override
  void update(void Function(MatchRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$MatchRecord build() {
    _$MatchRecord _$result;
    try {
      _$result = _$v ??
          new _$MatchRecord._(
              title: title,
              competition: competition,
              t1: t1,
              t2: t2,
              thumbnail: thumbnail,
              date: date,
              videos: _videos?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'videos';
        _videos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'MatchRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

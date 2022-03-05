// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InfoRecord> _$infoRecordSerializer = new _$InfoRecordSerializer();

class _$InfoRecordSerializer implements StructuredSerializer<InfoRecord> {
  @override
  final Iterable<Type> types = const [InfoRecord, _$InfoRecord];
  @override
  final String wireName = 'InfoRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, InfoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.playStoreLink;
    if (value != null) {
      result
        ..add('play_store_link')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shareMessage;
    if (value != null) {
      result
        ..add('share_message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  InfoRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InfoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'play_store_link':
          result.playStoreLink = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'share_message':
          result.shareMessage = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$InfoRecord extends InfoRecord {
  @override
  final String playStoreLink;
  @override
  final String shareMessage;
  @override
  final DocumentReference<Object> reference;

  factory _$InfoRecord([void Function(InfoRecordBuilder) updates]) =>
      (new InfoRecordBuilder()..update(updates)).build();

  _$InfoRecord._({this.playStoreLink, this.shareMessage, this.reference})
      : super._();

  @override
  InfoRecord rebuild(void Function(InfoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InfoRecordBuilder toBuilder() => new InfoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InfoRecord &&
        playStoreLink == other.playStoreLink &&
        shareMessage == other.shareMessage &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, playStoreLink.hashCode), shareMessage.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InfoRecord')
          ..add('playStoreLink', playStoreLink)
          ..add('shareMessage', shareMessage)
          ..add('reference', reference))
        .toString();
  }
}

class InfoRecordBuilder implements Builder<InfoRecord, InfoRecordBuilder> {
  _$InfoRecord _$v;

  String _playStoreLink;
  String get playStoreLink => _$this._playStoreLink;
  set playStoreLink(String playStoreLink) =>
      _$this._playStoreLink = playStoreLink;

  String _shareMessage;
  String get shareMessage => _$this._shareMessage;
  set shareMessage(String shareMessage) => _$this._shareMessage = shareMessage;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  InfoRecordBuilder() {
    InfoRecord._initializeBuilder(this);
  }

  InfoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _playStoreLink = $v.playStoreLink;
      _shareMessage = $v.shareMessage;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InfoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$InfoRecord;
  }

  @override
  void update(void Function(InfoRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InfoRecord build() {
    final _$result = _$v ??
        new _$InfoRecord._(
            playStoreLink: playStoreLink,
            shareMessage: shareMessage,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

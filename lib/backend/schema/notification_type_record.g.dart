// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_type_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotificationTypeRecord> _$notificationTypeRecordSerializer =
    new _$NotificationTypeRecordSerializer();

class _$NotificationTypeRecordSerializer
    implements StructuredSerializer<NotificationTypeRecord> {
  @override
  final Iterable<Type> types = const [
    NotificationTypeRecord,
    _$NotificationTypeRecord
  ];
  @override
  final String wireName = 'NotificationTypeRecord';

  @override
  Iterable<Object> serialize(
      Serializers serializers, NotificationTypeRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.context;
    if (value != null) {
      result
        ..add('context')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pageToOpen;
    if (value != null) {
      result
        ..add('page_to_open')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
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
  NotificationTypeRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotificationTypeRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'context':
          result.context = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'page_to_open':
          result.pageToOpen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
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

class _$NotificationTypeRecord extends NotificationTypeRecord {
  @override
  final String context;
  @override
  final String pageToOpen;
  @override
  final String type;
  @override
  final DocumentReference<Object> reference;

  factory _$NotificationTypeRecord(
          [void Function(NotificationTypeRecordBuilder) updates]) =>
      (new NotificationTypeRecordBuilder()..update(updates))._build();

  _$NotificationTypeRecord._(
      {this.context, this.pageToOpen, this.type, this.reference})
      : super._();

  @override
  NotificationTypeRecord rebuild(
          void Function(NotificationTypeRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotificationTypeRecordBuilder toBuilder() =>
      new NotificationTypeRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotificationTypeRecord &&
        context == other.context &&
        pageToOpen == other.pageToOpen &&
        type == other.type &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, context.hashCode), pageToOpen.hashCode), type.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotificationTypeRecord')
          ..add('context', context)
          ..add('pageToOpen', pageToOpen)
          ..add('type', type)
          ..add('reference', reference))
        .toString();
  }
}

class NotificationTypeRecordBuilder
    implements Builder<NotificationTypeRecord, NotificationTypeRecordBuilder> {
  _$NotificationTypeRecord _$v;

  String _context;
  String get context => _$this._context;
  set context(String context) => _$this._context = context;

  String _pageToOpen;
  String get pageToOpen => _$this._pageToOpen;
  set pageToOpen(String pageToOpen) => _$this._pageToOpen = pageToOpen;

  String _type;
  String get type => _$this._type;
  set type(String type) => _$this._type = type;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  NotificationTypeRecordBuilder() {
    NotificationTypeRecord._initializeBuilder(this);
  }

  NotificationTypeRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _context = $v.context;
      _pageToOpen = $v.pageToOpen;
      _type = $v.type;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotificationTypeRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotificationTypeRecord;
  }

  @override
  void update(void Function(NotificationTypeRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  NotificationTypeRecord build() => _build();

  _$NotificationTypeRecord _build() {
    final _$result = _$v ??
        new _$NotificationTypeRecord._(
            context: context,
            pageToOpen: pageToOpen,
            type: type,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

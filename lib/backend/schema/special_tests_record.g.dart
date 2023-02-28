// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_tests_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SpecialTestsRecord> _$specialTestsRecordSerializer =
    new _$SpecialTestsRecordSerializer();

class _$SpecialTestsRecordSerializer
    implements StructuredSerializer<SpecialTestsRecord> {
  @override
  final Iterable<Type> types = const [SpecialTestsRecord, _$SpecialTestsRecord];
  @override
  final String wireName = 'SpecialTestsRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, SpecialTestsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendorName;
    if (value != null) {
      result
        ..add('vendor_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.vendorContact;
    if (value != null) {
      result
        ..add('vendor_contact')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cost;
    if (value != null) {
      result
        ..add('cost')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.durationResults;
    if (value != null) {
      result
        ..add('duration_results')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.scheduledDate;
    if (value != null) {
      result
        ..add('scheduled_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.technologistAssigned;
    if (value != null) {
      result
        ..add('technologist_Assigned')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.bookingRef;
    if (value != null) {
      result
        ..add('booking_ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sampleCollected;
    if (value != null) {
      result
        ..add('sample_collected')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.resultSubmitted;
    if (value != null) {
      result
        ..add('result_submitted')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdDate;
    if (value != null) {
      result
        ..add('created_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.testAtHome;
    if (value != null) {
      result
        ..add('test_at_home')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.stringListIndex;
    if (value != null) {
      result
        ..add('stringListIndex')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.isVerified;
    if (value != null) {
      result
        ..add('isVerified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.pathologistNotes;
    if (value != null) {
      result
        ..add('pathologistNotes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.resultAttachment;
    if (value != null) {
      result
        ..add('resultAttachment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  SpecialTestsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SpecialTestsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor_name':
          result.vendorName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'vendor_contact':
          result.vendorContact = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'cost':
          result.cost = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'duration_results':
          result.durationResults = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'scheduled_date':
          result.scheduledDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'technologist_Assigned':
          result.technologistAssigned = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'booking_ref':
          result.bookingRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sample_collected':
          result.sampleCollected = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'result_submitted':
          result.resultSubmitted = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_date':
          result.createdDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'test_at_home':
          result.testAtHome = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'stringListIndex':
          result.stringListIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'isVerified':
          result.isVerified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'pathologistNotes':
          result.pathologistNotes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'resultAttachment':
          result.resultAttachment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$SpecialTestsRecord extends SpecialTestsRecord {
  @override
  final String? name;
  @override
  final String? vendorName;
  @override
  final String? vendorContact;
  @override
  final int? cost;
  @override
  final DateTime? durationResults;
  @override
  final DateTime? scheduledDate;
  @override
  final DocumentReference<Object?>? technologistAssigned;
  @override
  final DocumentReference<Object?>? bookingRef;
  @override
  final bool? sampleCollected;
  @override
  final bool? resultSubmitted;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdDate;
  @override
  final String? description;
  @override
  final bool? testAtHome;
  @override
  final String? category;
  @override
  final int? stringListIndex;
  @override
  final bool? isVerified;
  @override
  final String? pathologistNotes;
  @override
  final String? resultAttachment;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$SpecialTestsRecord(
          [void Function(SpecialTestsRecordBuilder)? updates]) =>
      (new SpecialTestsRecordBuilder()..update(updates))._build();

  _$SpecialTestsRecord._(
      {this.name,
      this.vendorName,
      this.vendorContact,
      this.cost,
      this.durationResults,
      this.scheduledDate,
      this.technologistAssigned,
      this.bookingRef,
      this.sampleCollected,
      this.resultSubmitted,
      this.createdBy,
      this.createdDate,
      this.description,
      this.testAtHome,
      this.category,
      this.stringListIndex,
      this.isVerified,
      this.pathologistNotes,
      this.resultAttachment,
      this.ffRef})
      : super._();

  @override
  SpecialTestsRecord rebuild(
          void Function(SpecialTestsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SpecialTestsRecordBuilder toBuilder() =>
      new SpecialTestsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SpecialTestsRecord &&
        name == other.name &&
        vendorName == other.vendorName &&
        vendorContact == other.vendorContact &&
        cost == other.cost &&
        durationResults == other.durationResults &&
        scheduledDate == other.scheduledDate &&
        technologistAssigned == other.technologistAssigned &&
        bookingRef == other.bookingRef &&
        sampleCollected == other.sampleCollected &&
        resultSubmitted == other.resultSubmitted &&
        createdBy == other.createdBy &&
        createdDate == other.createdDate &&
        description == other.description &&
        testAtHome == other.testAtHome &&
        category == other.category &&
        stringListIndex == other.stringListIndex &&
        isVerified == other.isVerified &&
        pathologistNotes == other.pathologistNotes &&
        resultAttachment == other.resultAttachment &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc(
                                                                                $jc(
                                                                                    0,
                                                                                    name
                                                                                        .hashCode),
                                                                                vendorName
                                                                                    .hashCode),
                                                                            vendorContact
                                                                                .hashCode),
                                                                        cost
                                                                            .hashCode),
                                                                    durationResults
                                                                        .hashCode),
                                                                scheduledDate
                                                                    .hashCode),
                                                            technologistAssigned
                                                                .hashCode),
                                                        bookingRef.hashCode),
                                                    sampleCollected.hashCode),
                                                resultSubmitted.hashCode),
                                            createdBy.hashCode),
                                        createdDate.hashCode),
                                    description.hashCode),
                                testAtHome.hashCode),
                            category.hashCode),
                        stringListIndex.hashCode),
                    isVerified.hashCode),
                pathologistNotes.hashCode),
            resultAttachment.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SpecialTestsRecord')
          ..add('name', name)
          ..add('vendorName', vendorName)
          ..add('vendorContact', vendorContact)
          ..add('cost', cost)
          ..add('durationResults', durationResults)
          ..add('scheduledDate', scheduledDate)
          ..add('technologistAssigned', technologistAssigned)
          ..add('bookingRef', bookingRef)
          ..add('sampleCollected', sampleCollected)
          ..add('resultSubmitted', resultSubmitted)
          ..add('createdBy', createdBy)
          ..add('createdDate', createdDate)
          ..add('description', description)
          ..add('testAtHome', testAtHome)
          ..add('category', category)
          ..add('stringListIndex', stringListIndex)
          ..add('isVerified', isVerified)
          ..add('pathologistNotes', pathologistNotes)
          ..add('resultAttachment', resultAttachment)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class SpecialTestsRecordBuilder
    implements Builder<SpecialTestsRecord, SpecialTestsRecordBuilder> {
  _$SpecialTestsRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _vendorName;
  String? get vendorName => _$this._vendorName;
  set vendorName(String? vendorName) => _$this._vendorName = vendorName;

  String? _vendorContact;
  String? get vendorContact => _$this._vendorContact;
  set vendorContact(String? vendorContact) =>
      _$this._vendorContact = vendorContact;

  int? _cost;
  int? get cost => _$this._cost;
  set cost(int? cost) => _$this._cost = cost;

  DateTime? _durationResults;
  DateTime? get durationResults => _$this._durationResults;
  set durationResults(DateTime? durationResults) =>
      _$this._durationResults = durationResults;

  DateTime? _scheduledDate;
  DateTime? get scheduledDate => _$this._scheduledDate;
  set scheduledDate(DateTime? scheduledDate) =>
      _$this._scheduledDate = scheduledDate;

  DocumentReference<Object?>? _technologistAssigned;
  DocumentReference<Object?>? get technologistAssigned =>
      _$this._technologistAssigned;
  set technologistAssigned(DocumentReference<Object?>? technologistAssigned) =>
      _$this._technologistAssigned = technologistAssigned;

  DocumentReference<Object?>? _bookingRef;
  DocumentReference<Object?>? get bookingRef => _$this._bookingRef;
  set bookingRef(DocumentReference<Object?>? bookingRef) =>
      _$this._bookingRef = bookingRef;

  bool? _sampleCollected;
  bool? get sampleCollected => _$this._sampleCollected;
  set sampleCollected(bool? sampleCollected) =>
      _$this._sampleCollected = sampleCollected;

  bool? _resultSubmitted;
  bool? get resultSubmitted => _$this._resultSubmitted;
  set resultSubmitted(bool? resultSubmitted) =>
      _$this._resultSubmitted = resultSubmitted;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdDate;
  DateTime? get createdDate => _$this._createdDate;
  set createdDate(DateTime? createdDate) => _$this._createdDate = createdDate;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _testAtHome;
  bool? get testAtHome => _$this._testAtHome;
  set testAtHome(bool? testAtHome) => _$this._testAtHome = testAtHome;

  String? _category;
  String? get category => _$this._category;
  set category(String? category) => _$this._category = category;

  int? _stringListIndex;
  int? get stringListIndex => _$this._stringListIndex;
  set stringListIndex(int? stringListIndex) =>
      _$this._stringListIndex = stringListIndex;

  bool? _isVerified;
  bool? get isVerified => _$this._isVerified;
  set isVerified(bool? isVerified) => _$this._isVerified = isVerified;

  String? _pathologistNotes;
  String? get pathologistNotes => _$this._pathologistNotes;
  set pathologistNotes(String? pathologistNotes) =>
      _$this._pathologistNotes = pathologistNotes;

  String? _resultAttachment;
  String? get resultAttachment => _$this._resultAttachment;
  set resultAttachment(String? resultAttachment) =>
      _$this._resultAttachment = resultAttachment;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  SpecialTestsRecordBuilder() {
    SpecialTestsRecord._initializeBuilder(this);
  }

  SpecialTestsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _vendorName = $v.vendorName;
      _vendorContact = $v.vendorContact;
      _cost = $v.cost;
      _durationResults = $v.durationResults;
      _scheduledDate = $v.scheduledDate;
      _technologistAssigned = $v.technologistAssigned;
      _bookingRef = $v.bookingRef;
      _sampleCollected = $v.sampleCollected;
      _resultSubmitted = $v.resultSubmitted;
      _createdBy = $v.createdBy;
      _createdDate = $v.createdDate;
      _description = $v.description;
      _testAtHome = $v.testAtHome;
      _category = $v.category;
      _stringListIndex = $v.stringListIndex;
      _isVerified = $v.isVerified;
      _pathologistNotes = $v.pathologistNotes;
      _resultAttachment = $v.resultAttachment;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SpecialTestsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SpecialTestsRecord;
  }

  @override
  void update(void Function(SpecialTestsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  SpecialTestsRecord build() => _build();

  _$SpecialTestsRecord _build() {
    final _$result = _$v ??
        new _$SpecialTestsRecord._(
            name: name,
            vendorName: vendorName,
            vendorContact: vendorContact,
            cost: cost,
            durationResults: durationResults,
            scheduledDate: scheduledDate,
            technologistAssigned: technologistAssigned,
            bookingRef: bookingRef,
            sampleCollected: sampleCollected,
            resultSubmitted: resultSubmitted,
            createdBy: createdBy,
            createdDate: createdDate,
            description: description,
            testAtHome: testAtHome,
            category: category,
            stringListIndex: stringListIndex,
            isVerified: isVerified,
            pathologistNotes: pathologistNotes,
            resultAttachment: resultAttachment,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas

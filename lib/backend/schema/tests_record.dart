import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tests_record.g.dart';

abstract class TestsRecord implements Built<TestsRecord, TestsRecordBuilder> {
  static Serializer<TestsRecord> get serializer => _$testsRecordSerializer;

  int? get price;

  String? get name;

  @BuiltValueField(wireName: 'home_test')
  bool? get homeTest;

  String? get description;

  double? get duration;

  @BuiltValueField(wireName: 'duration_results')
  double? get durationResults;

  String? get category;

  @BuiltValueField(wireName: 'is_available')
  bool? get isAvailable;

  @BuiltValueField(wireName: 'Keywords')
  BuiltList<String>? get keywords;

  @BuiltValueField(wireName: 'update_date')
  DateTime? get updateDate;

  String? get updateRole;

  String? get varianceMale;

  String? get varianceFemale;

  String? get varianceUnitsMale;

  String? get varianceUnitsFemale;

  String? get equipmentInfo;

  BuiltList<String>? get procedure;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TestsRecordBuilder builder) => builder
    ..price = 0
    ..name = ''
    ..homeTest = false
    ..description = ''
    ..duration = 0.0
    ..durationResults = 0.0
    ..category = ''
    ..isAvailable = false
    ..keywords = ListBuilder()
    ..updateRole = ''
    ..varianceMale = ''
    ..varianceFemale = ''
    ..varianceUnitsMale = ''
    ..varianceUnitsFemale = ''
    ..equipmentInfo = ''
    ..procedure = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tests');

  static Stream<TestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TestsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TestsRecord._();
  factory TestsRecord([void Function(TestsRecordBuilder) updates]) =
      _$TestsRecord;

  static TestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTestsRecordData({
  int? price,
  String? name,
  bool? homeTest,
  String? description,
  double? duration,
  double? durationResults,
  String? category,
  bool? isAvailable,
  DateTime? updateDate,
  String? updateRole,
  String? varianceMale,
  String? varianceFemale,
  String? varianceUnitsMale,
  String? varianceUnitsFemale,
  String? equipmentInfo,
}) {
  final firestoreData = serializers.toFirestore(
    TestsRecord.serializer,
    TestsRecord(
      (t) => t
        ..price = price
        ..name = name
        ..homeTest = homeTest
        ..description = description
        ..duration = duration
        ..durationResults = durationResults
        ..category = category
        ..isAvailable = isAvailable
        ..keywords = null
        ..updateDate = updateDate
        ..updateRole = updateRole
        ..varianceMale = varianceMale
        ..varianceFemale = varianceFemale
        ..varianceUnitsMale = varianceUnitsMale
        ..varianceUnitsFemale = varianceUnitsFemale
        ..equipmentInfo = equipmentInfo
        ..procedure = null,
    ),
  );

  return firestoreData;
}

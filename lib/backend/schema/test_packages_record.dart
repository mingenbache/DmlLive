import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_packages_record.g.dart';

abstract class TestPackagesRecord
    implements Built<TestPackagesRecord, TestPackagesRecordBuilder> {
  static Serializer<TestPackagesRecord> get serializer =>
      _$testPackagesRecordSerializer;

  @BuiltValueField(wireName: 'PackageName')
  String? get packageName;

  @BuiltValueField(wireName: 'Price')
  int? get price;

  @BuiltValueField(wireName: 'TestsIncluded')
  BuiltList<DocumentReference>? get testsIncluded;

  String? get description;

  double? get duration;

  @BuiltValueField(wireName: 'duration_results')
  double? get durationResults;

  String? get category;

  bool? get atHome;

  bool? get isAvailable;

  @BuiltValueField(wireName: 'create_Staff')
  DocumentReference? get createStaff;

  @BuiltValueField(wireName: 'create_date')
  DateTime? get createDate;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TestPackagesRecordBuilder builder) => builder
    ..packageName = ''
    ..price = 0
    ..testsIncluded = ListBuilder()
    ..description = ''
    ..duration = 0.0
    ..durationResults = 0.0
    ..category = ''
    ..atHome = false
    ..isAvailable = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_Packages');

  static Stream<TestPackagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TestPackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TestPackagesRecord._();
  factory TestPackagesRecord(
          [void Function(TestPackagesRecordBuilder) updates]) =
      _$TestPackagesRecord;

  static TestPackagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTestPackagesRecordData({
  String? packageName,
  int? price,
  String? description,
  double? duration,
  double? durationResults,
  String? category,
  bool? atHome,
  bool? isAvailable,
  DocumentReference? createStaff,
  DateTime? createDate,
}) {
  final firestoreData = serializers.toFirestore(
    TestPackagesRecord.serializer,
    TestPackagesRecord(
      (t) => t
        ..packageName = packageName
        ..price = price
        ..testsIncluded = null
        ..description = description
        ..duration = duration
        ..durationResults = durationResults
        ..category = category
        ..atHome = atHome
        ..isAvailable = isAvailable
        ..createStaff = createStaff
        ..createDate = createDate,
    ),
  );

  return firestoreData;
}

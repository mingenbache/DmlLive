import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_packages_record.g.dart';

abstract class TestPackagesRecord
    implements Built<TestPackagesRecord, TestPackagesRecordBuilder> {
  static Serializer<TestPackagesRecord> get serializer =>
      _$testPackagesRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'PackageName')
  String get packageName;

  @nullable
  @BuiltValueField(wireName: 'Price')
  int get price;

  @nullable
  @BuiltValueField(wireName: 'TestsIncluded')
  BuiltList<DocumentReference> get testsIncluded;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TestPackagesRecordBuilder builder) => builder
    ..packageName = ''
    ..price = 0
    ..testsIncluded = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('test_Packages');

  static Stream<TestPackagesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TestPackagesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  TestPackagesRecord._();
  factory TestPackagesRecord(
          [void Function(TestPackagesRecordBuilder) updates]) =
      _$TestPackagesRecord;

  static TestPackagesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTestPackagesRecordData({
  String packageName,
  int price,
}) =>
    serializers.toFirestore(
        TestPackagesRecord.serializer,
        TestPackagesRecord((t) => t
          ..packageName = packageName
          ..price = price
          ..testsIncluded = null));

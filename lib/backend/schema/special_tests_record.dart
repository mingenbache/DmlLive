import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'special_tests_record.g.dart';

abstract class SpecialTestsRecord
    implements Built<SpecialTestsRecord, SpecialTestsRecordBuilder> {
  static Serializer<SpecialTestsRecord> get serializer =>
      _$specialTestsRecordSerializer;

  String? get name;

  @BuiltValueField(wireName: 'vendor_name')
  String? get vendorName;

  @BuiltValueField(wireName: 'vendor_contact')
  String? get vendorContact;

  int? get cost;

  @BuiltValueField(wireName: 'duration_results')
  DateTime? get durationResults;

  @BuiltValueField(wireName: 'scheduled_date')
  DateTime? get scheduledDate;

  @BuiltValueField(wireName: 'technologist_Assigned')
  DocumentReference? get technologistAssigned;

  @BuiltValueField(wireName: 'booking_ref')
  DocumentReference? get bookingRef;

  @BuiltValueField(wireName: 'sample_collected')
  bool? get sampleCollected;

  @BuiltValueField(wireName: 'result_submitted')
  bool? get resultSubmitted;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_date')
  DateTime? get createdDate;

  String? get description;

  @BuiltValueField(wireName: 'test_at_home')
  bool? get testAtHome;

  String? get category;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(SpecialTestsRecordBuilder builder) => builder
    ..name = ''
    ..vendorName = ''
    ..vendorContact = ''
    ..cost = 0
    ..sampleCollected = false
    ..resultSubmitted = false
    ..description = ''
    ..testAtHome = false
    ..category = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('special_tests');

  static Stream<SpecialTestsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<SpecialTestsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  SpecialTestsRecord._();
  factory SpecialTestsRecord(
          [void Function(SpecialTestsRecordBuilder) updates]) =
      _$SpecialTestsRecord;

  static SpecialTestsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createSpecialTestsRecordData({
  String? name,
  String? vendorName,
  String? vendorContact,
  int? cost,
  DateTime? durationResults,
  DateTime? scheduledDate,
  DocumentReference? technologistAssigned,
  DocumentReference? bookingRef,
  bool? sampleCollected,
  bool? resultSubmitted,
  DocumentReference? createdBy,
  DateTime? createdDate,
  String? description,
  bool? testAtHome,
  String? category,
}) {
  final firestoreData = serializers.toFirestore(
    SpecialTestsRecord.serializer,
    SpecialTestsRecord(
      (s) => s
        ..name = name
        ..vendorName = vendorName
        ..vendorContact = vendorContact
        ..cost = cost
        ..durationResults = durationResults
        ..scheduledDate = scheduledDate
        ..technologistAssigned = technologistAssigned
        ..bookingRef = bookingRef
        ..sampleCollected = sampleCollected
        ..resultSubmitted = resultSubmitted
        ..createdBy = createdBy
        ..createdDate = createdDate
        ..description = description
        ..testAtHome = testAtHome
        ..category = category,
    ),
  );

  return firestoreData;
}

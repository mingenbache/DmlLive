import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  DocumentReference? get booking;

  BuiltList<DocumentReference>? get testedTests;

  DocumentReference? get bookinguser;

  DocumentReference? get doctor;

  BuiltList<DocumentReference>? get technologist;

  String? get pathologistComments;

  @BuiltValueField(wireName: 'samples_released')
  BuiltList<String>? get samplesReleased;

  DateTime? get createdDate;

  DocumentReference? get createdUser;

  bool? get isComplete;

  String? get patientName;

  String? get patientSex;

  String? get labRefNum;

  String? get pathologist;

  @BuiltValueField(wireName: 'DML_Email')
  String? get dMLEmail;

  int? get patientAge;

  BuiltList<DocumentReference>? get testpackageList;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ReportsRecordBuilder builder) => builder
    ..testedTests = ListBuilder()
    ..technologist = ListBuilder()
    ..pathologistComments = ''
    ..samplesReleased = ListBuilder()
    ..isComplete = false
    ..patientName = ''
    ..patientSex = ''
    ..labRefNum = ''
    ..pathologist = ''
    ..dMLEmail = ''
    ..patientAge = 0
    ..testpackageList = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;

  static ReportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference? booking,
  DocumentReference? bookinguser,
  DocumentReference? doctor,
  String? pathologistComments,
  DateTime? createdDate,
  DocumentReference? createdUser,
  bool? isComplete,
  String? patientName,
  String? patientSex,
  String? labRefNum,
  String? pathologist,
  String? dMLEmail,
  int? patientAge,
}) {
  final firestoreData = serializers.toFirestore(
    ReportsRecord.serializer,
    ReportsRecord(
      (r) => r
        ..booking = booking
        ..testedTests = null
        ..bookinguser = bookinguser
        ..doctor = doctor
        ..technologist = null
        ..pathologistComments = pathologistComments
        ..samplesReleased = null
        ..createdDate = createdDate
        ..createdUser = createdUser
        ..isComplete = isComplete
        ..patientName = patientName
        ..patientSex = patientSex
        ..labRefNum = labRefNum
        ..pathologist = pathologist
        ..dMLEmail = dMLEmail
        ..patientAge = patientAge
        ..testpackageList = null,
    ),
  );

  return firestoreData;
}

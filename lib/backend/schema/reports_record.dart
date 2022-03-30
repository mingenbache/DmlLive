import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @nullable
  DocumentReference get booking;

  @nullable
  BuiltList<DocumentReference> get testedTests;

  @nullable
  DocumentReference get bookinguser;

  @nullable
  DocumentReference get doctor;

  @nullable
  BuiltList<DocumentReference> get technologist;

  @nullable
  String get pathologistComments;

  @nullable
  @BuiltValueField(wireName: 'samples_released')
  BuiltList<String> get samplesReleased;

  @nullable
  DateTime get createdDate;

  @nullable
  DocumentReference get createdUser;

  @nullable
  bool get isComplete;

  @nullable
  String get patientName;

  @nullable
  String get patientSex;

  @nullable
  String get labRefNum;

  @nullable
  String get pathologist;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReportsRecordBuilder builder) => builder
    ..testedTests = ListBuilder()
    ..technologist = ListBuilder()
    ..pathologistComments = ''
    ..samplesReleased = ListBuilder()
    ..isComplete = false
    ..patientName = ''
    ..patientSex = ''
    ..labRefNum = ''
    ..pathologist = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;

  static ReportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReportsRecordData({
  DocumentReference booking,
  DocumentReference bookinguser,
  DocumentReference doctor,
  String pathologistComments,
  DateTime createdDate,
  DocumentReference createdUser,
  bool isComplete,
  String patientName,
  String patientSex,
  String labRefNum,
  String pathologist,
}) =>
    serializers.toFirestore(
        ReportsRecord.serializer,
        ReportsRecord((r) => r
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
          ..pathologist = pathologist));

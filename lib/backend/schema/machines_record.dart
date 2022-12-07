import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'machines_record.g.dart';

abstract class MachinesRecord
    implements Built<MachinesRecord, MachinesRecordBuilder> {
  static Serializer<MachinesRecord> get serializer =>
      _$machinesRecordSerializer;

  String? get name;

  String? get metadata;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MachinesRecordBuilder builder) => builder
    ..name = ''
    ..metadata = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('machines');

  static Stream<MachinesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MachinesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MachinesRecord._();
  factory MachinesRecord([void Function(MachinesRecordBuilder) updates]) =
      _$MachinesRecord;

  static MachinesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMachinesRecordData({
  String? name,
  String? metadata,
}) {
  final firestoreData = serializers.toFirestore(
    MachinesRecord.serializer,
    MachinesRecord(
      (m) => m
        ..name = name
        ..metadata = metadata,
    ),
  );

  return firestoreData;
}

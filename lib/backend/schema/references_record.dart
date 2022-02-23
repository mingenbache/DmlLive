import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'references_record.g.dart';

abstract class ReferencesRecord
    implements Built<ReferencesRecord, ReferencesRecordBuilder> {
  static Serializer<ReferencesRecord> get serializer =>
      _$referencesRecordSerializer;

  @nullable
  BuiltList<DocumentReference> get doctors;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReferencesRecordBuilder builder) =>
      builder..doctors = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('references');

  static Stream<ReferencesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReferencesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReferencesRecord._();
  factory ReferencesRecord([void Function(ReferencesRecordBuilder) updates]) =
      _$ReferencesRecord;

  static ReferencesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReferencesRecordData() => serializers.toFirestore(
    ReferencesRecord.serializer, ReferencesRecord((r) => r..doctors = null));

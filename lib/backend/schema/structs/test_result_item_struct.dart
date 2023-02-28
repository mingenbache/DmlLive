import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'test_result_item_struct.g.dart';

abstract class TestResultItemStruct
    implements Built<TestResultItemStruct, TestResultItemStructBuilder> {
  static Serializer<TestResultItemStruct> get serializer =>
      _$testResultItemStructSerializer;

  @BuiltValueField(wireName: 'test_name')
  String? get testName;

  String? get pathologistNote;

  String? get type;

  DocumentReference? get specialTestRef;

  DocumentReference? get bookedTestRef;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(TestResultItemStructBuilder builder) => builder
    ..testName = ''
    ..pathologistNote = ''
    ..type = ''
    ..firestoreUtilData = FirestoreUtilData();

  TestResultItemStruct._();
  factory TestResultItemStruct(
          [void Function(TestResultItemStructBuilder) updates]) =
      _$TestResultItemStruct;
}

TestResultItemStruct createTestResultItemStruct({
  String? testName,
  String? pathologistNote,
  String? type,
  DocumentReference? specialTestRef,
  DocumentReference? bookedTestRef,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TestResultItemStruct(
      (t) => t
        ..testName = testName
        ..pathologistNote = pathologistNote
        ..type = type
        ..specialTestRef = specialTestRef
        ..bookedTestRef = bookedTestRef
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

TestResultItemStruct? updateTestResultItemStruct(
  TestResultItemStruct? testResultItem, {
  bool clearUnsetFields = true,
}) =>
    testResultItem != null
        ? (testResultItem.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addTestResultItemStructData(
  Map<String, dynamic> firestoreData,
  TestResultItemStruct? testResultItem,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (testResultItem == null) {
    return;
  }
  if (testResultItem.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && testResultItem.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final testResultItemData =
      getTestResultItemFirestoreData(testResultItem, forFieldValue);
  final nestedData =
      testResultItemData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = testResultItem.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getTestResultItemFirestoreData(
  TestResultItemStruct? testResultItem, [
  bool forFieldValue = false,
]) {
  if (testResultItem == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(TestResultItemStruct.serializer, testResultItem);

  // Add any Firestore field values
  testResultItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestResultItemListFirestoreData(
  List<TestResultItemStruct>? testResultItems,
) =>
    testResultItems
        ?.map((t) => getTestResultItemFirestoreData(t, true))
        .toList() ??
    [];

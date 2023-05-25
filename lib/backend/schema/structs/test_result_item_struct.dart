// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TestResultItemStruct extends FFFirebaseStruct {
  TestResultItemStruct({
    String? testName,
    String? pathologistNote,
    String? type,
    DocumentReference? specialTestRef,
    DocumentReference? bookedTestRef,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _testName = testName,
        _pathologistNote = pathologistNote,
        _type = type,
        _specialTestRef = specialTestRef,
        _bookedTestRef = bookedTestRef,
        super(firestoreUtilData);

  // "test_name" field.
  String? _testName;
  String get testName => _testName ?? '';
  set testName(String? val) => _testName = val;
  bool hasTestName() => _testName != null;

  // "pathologistNote" field.
  String? _pathologistNote;
  String get pathologistNote => _pathologistNote ?? '';
  set pathologistNote(String? val) => _pathologistNote = val;
  bool hasPathologistNote() => _pathologistNote != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  // "specialTestRef" field.
  DocumentReference? _specialTestRef;
  DocumentReference? get specialTestRef => _specialTestRef;
  set specialTestRef(DocumentReference? val) => _specialTestRef = val;
  bool hasSpecialTestRef() => _specialTestRef != null;

  // "bookedTestRef" field.
  DocumentReference? _bookedTestRef;
  DocumentReference? get bookedTestRef => _bookedTestRef;
  set bookedTestRef(DocumentReference? val) => _bookedTestRef = val;
  bool hasBookedTestRef() => _bookedTestRef != null;

  static TestResultItemStruct fromMap(Map<String, dynamic> data) =>
      TestResultItemStruct(
        testName: data['test_name'] as String?,
        pathologistNote: data['pathologistNote'] as String?,
        type: data['type'] as String?,
        specialTestRef: data['specialTestRef'] as DocumentReference?,
        bookedTestRef: data['bookedTestRef'] as DocumentReference?,
      );

  static TestResultItemStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TestResultItemStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'test_name': _testName,
        'pathologistNote': _pathologistNote,
        'type': _type,
        'specialTestRef': _specialTestRef,
        'bookedTestRef': _bookedTestRef,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'test_name': serializeParam(
          _testName,
          ParamType.String,
        ),
        'pathologistNote': serializeParam(
          _pathologistNote,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'specialTestRef': serializeParam(
          _specialTestRef,
          ParamType.DocumentReference,
        ),
        'bookedTestRef': serializeParam(
          _bookedTestRef,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TestResultItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      TestResultItemStruct(
        testName: deserializeParam(
          data['test_name'],
          ParamType.String,
          false,
        ),
        pathologistNote: deserializeParam(
          data['pathologistNote'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        specialTestRef: deserializeParam(
          data['specialTestRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['special_tests'],
        ),
        bookedTestRef: deserializeParam(
          data['bookedTestRef'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['booked_tests'],
        ),
      );

  @override
  String toString() => 'TestResultItemStruct(${toMap()})';
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
      testName: testName,
      pathologistNote: pathologistNote,
      type: type,
      specialTestRef: specialTestRef,
      bookedTestRef: bookedTestRef,
      firestoreUtilData: FirestoreUtilData(
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
    testResultItem
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

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
}

Map<String, dynamic> getTestResultItemFirestoreData(
  TestResultItemStruct? testResultItem, [
  bool forFieldValue = false,
]) {
  if (testResultItem == null) {
    return {};
  }
  final firestoreData = mapToFirestore(testResultItem.toMap());

  // Add any Firestore field values
  testResultItem.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTestResultItemListFirestoreData(
  List<TestResultItemStruct>? testResultItems,
) =>
    testResultItems
        ?.map((e) => getTestResultItemFirestoreData(e, true))
        .toList() ??
    [];

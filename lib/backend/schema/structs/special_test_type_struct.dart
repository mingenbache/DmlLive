// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SpecialTestTypeStruct extends FFFirebaseStruct {
  SpecialTestTypeStruct({
    String? name,
    String? description,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _description = description,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  static SpecialTestTypeStruct fromMap(Map<String, dynamic> data) =>
      SpecialTestTypeStruct(
        name: data['name'] as String?,
        description: data['description'] as String?,
      );

  static SpecialTestTypeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SpecialTestTypeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'description': _description,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
      }.withoutNulls;

  static SpecialTestTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      SpecialTestTypeStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SpecialTestTypeStruct(${toMap()})';
}

SpecialTestTypeStruct createSpecialTestTypeStruct({
  String? name,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SpecialTestTypeStruct(
      name: name,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SpecialTestTypeStruct? updateSpecialTestTypeStruct(
  SpecialTestTypeStruct? specialTestType, {
  bool clearUnsetFields = true,
}) =>
    specialTestType
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addSpecialTestTypeStructData(
  Map<String, dynamic> firestoreData,
  SpecialTestTypeStruct? specialTestType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (specialTestType == null) {
    return;
  }
  if (specialTestType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && specialTestType.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final specialTestTypeData =
      getSpecialTestTypeFirestoreData(specialTestType, forFieldValue);
  final nestedData =
      specialTestTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = specialTestType.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSpecialTestTypeFirestoreData(
  SpecialTestTypeStruct? specialTestType, [
  bool forFieldValue = false,
]) {
  if (specialTestType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(specialTestType.toMap());

  // Add any Firestore field values
  specialTestType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSpecialTestTypeListFirestoreData(
  List<SpecialTestTypeStruct>? specialTestTypes,
) =>
    specialTestTypes
        ?.map((e) => getSpecialTestTypeFirestoreData(e, true))
        .toList() ??
    [];

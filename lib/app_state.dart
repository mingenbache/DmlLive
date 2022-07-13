import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _isPatient = prefs.getBool('ff_isPatient') ?? _isPatient;
    _numTests = prefs.getInt('ff_numTests') ?? _numTests;
    _numTestDone = prefs.getInt('ff_numTestDone') ?? _numTestDone;
    _notifHeight = prefs.getDouble('ff_notifHeight') ?? _notifHeight;
    _proceedconfirmation =
        prefs.getBool('ff_proceedconfirmation') ?? _proceedconfirmation;
    _testPackTests = prefs
            .getStringList('ff_testPackTests')
            ?.map((path) => path.ref)
            ?.toList() ??
        _testPackTests;
    _testPackSubmit = prefs.getBool('ff_testPackSubmit') ?? _testPackSubmit;
    _firstTime = prefs.getBool('ff_firstTime') ?? _firstTime;
  }

  SharedPreferences prefs;

  String labRef = '';

  DateTime datepicked;

  DateTime selectedDate;

  String categorypicked = 'all';

  bool _isPatient = false;
  bool get isPatient => _isPatient;
  set isPatient(bool _value) {
    _isPatient = _value;
    prefs.setBool('ff_isPatient', _value);
  }

  bool lastBookingPage = false;

  DateTime calendarDate;

  bool isSubmitted = false;

  DateTime dob;

  bool dobEntered = false;

  String userListQuery = '';

  bool pathologistassigned = false;

  bool technologistassigned = false;

  double numTestsDone = 0.0;

  int _numTests = 0;
  int get numTests => _numTests;
  set numTests(int _value) {
    _numTests = _value;
    prefs.setInt('ff_numTests', _value);
  }

  int _numTestDone = 0;
  int get numTestDone => _numTestDone;
  set numTestDone(int _value) {
    _numTestDone = _value;
    prefs.setInt('ff_numTestDone', _value);
  }

  bool allCategories = false;

  double _notifHeight = 200;
  double get notifHeight => _notifHeight;
  set notifHeight(double _value) {
    _notifHeight = _value;
    prefs.setDouble('ff_notifHeight', _value);
  }

  bool _proceedconfirmation = false;
  bool get proceedconfirmation => _proceedconfirmation;
  set proceedconfirmation(bool _value) {
    _proceedconfirmation = _value;
    prefs.setBool('ff_proceedconfirmation', _value);
  }

  bool assignTechnologist = false;

  bool reportLastPage = false;

  List<String> reportEmails = [];

  List<DocumentReference> _testPackTests = [];
  List<DocumentReference> get testPackTests => _testPackTests;
  set testPackTests(List<DocumentReference> _value) {
    _testPackTests = _value;
    prefs.setStringList('ff_testPackTests', _value.map((x) => x.path).toList());
  }

  void addToTestPackTests(DocumentReference _value) {
    _testPackTests.add(_value);
    prefs.setStringList(
        'ff_testPackTests', _testPackTests.map((x) => x.path).toList());
  }

  void removeFromTestPackTests(DocumentReference _value) {
    _testPackTests.remove(_value);
    prefs.setStringList(
        'ff_testPackTests', _testPackTests.map((x) => x.path).toList());
  }

  bool _testPackSubmit = false;
  bool get testPackSubmit => _testPackSubmit;
  set testPackSubmit(bool _value) {
    _testPackSubmit = _value;
    prefs.setBool('ff_testPackSubmit', _value);
  }

  String packagecategoryPicked = 'all';

  bool allPackageCategories = false;

  List<DocumentReference> duplicateTests = [];

  DocumentReference duplicateTest;

  String testsVar = '';

  String paymentsvar = '';

  bool _firstTime = false;
  bool get firstTime => _firstTime;
  set firstTime(bool _value) {
    _firstTime = _value;
    prefs.setBool('ff_firstTime', _value);
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

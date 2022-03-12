import 'package:shared_preferences/shared_preferences.dart';
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

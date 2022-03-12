import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double addBookingPaymentBalance(
  int current,
  int itemprice,
) {
  current = current + itemprice;
  return current.toDouble(); // Add your function code here!
}

int addCartTotal(
  int current,
  int itemprice,
) {
  current = current + itemprice;
  return current; // Add your function code here!
}

int removeFromCart(
  int current,
  int itemprice,
) {
  current = current - itemprice;
  return current;
  // Add your function code here!
}

List<String> keyWordsMultipleFields(
  String field1,
  String field2,
) {
  var string1 = field1.toLowerCase();
  var string2 = field2.toLowerCase();
  var inputString = string1 + " " + string2;
  final list = inputString.split(" ");
  var keywords = [
    " ",
    string1,
    string2,
  ];

  var listIterator = list.iterator;
  while (listIterator.moveNext()) {
    var appendString = "";
    listIterator.current.runes.forEach((int rune) {
      appendString += String.fromCharCode(rune);
      keywords.add(appendString);
    });
    inputString = inputString.replaceAll(listIterator.current.toString(), " ");
  }
  return keywords;

  return keywords;
}

DateTime getDayToday() {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  return today;
}

bool getDayIsWeekday(DateTime date) {
  bool result;

  if (date.weekday != 7) {
    result = true;
  } else {
    result = false;
  }
  // var nextWeek = new DateTime.now().add(new Duration(days: (dateToday.weekday < 6) ? 7 - dateToday.weekday : 0));
  return result;
}

int doubletoInt(double durationDouble) {
  // convert double to int
  int duration = durationDouble.toInt();
  return duration;
}

double intToDouble(int amountInt) {
  // convert int to double
  return (amountInt + 0.0).toDouble();
}

String isPatientFillDetails(
  BookingsRecord booking,
  String string,
) {
  // check if boolean field in document is true and return string field , if false return null
  var _isUserPatient = booking.userPatient;
  var returnString;
  if (_isUserPatient == true && string == 'firstname') {
    returnString = booking.firstname;
  } else if (_isUserPatient == true && string == 'lastname') {
    returnString = booking.lastname;
  } else if (_isUserPatient == true && string == 'phonenumber') {
    returnString = booking.phonenumber;
  } else if (_isUserPatient == true && string == 'sex') {
    returnString = booking.sex;
  } else if (_isUserPatient == true && string == 'emailaddress') {
    returnString = booking.emailaddress;
  } else if (_isUserPatient == true && string == 'd_o_b') {
    returnString = booking.dOB;
  } else if (_isUserPatient == false && string == 'firstname') {
    return null;
  } else if (_isUserPatient == false && string == 'lastname') {
    return null;
  } else if (_isUserPatient == false && string == 'phonenumber') {
    return null;
  } else if (_isUserPatient == false && string == 'sex') {
    return null;
  } else if (_isUserPatient == false && string == 'emailaddress') {
    return null;
  } else {
    return 'error';
  }
  return returnString;
  return returnString;
}

String isPatientFillFname(BookingsRecord booking) {
  // check if boolean field in document is true and return string field , if false return null
  var _isUserPatient = booking.userPatient;
  var returnString;
  if (_isUserPatient == true) {
    returnString = booking.firstname;
  } else {
    return 'error';
  }
  return returnString;
}

String datetoString(DateTime dateGiven) {
  // Add your function code here! return timestamp as string
  //var formatter = new DateFormat('yyyy-MM-dd');
  var formatter = new DateFormat('yMMMMd');
  String formatted = formatter.format(dateGiven);
  return formatted;
}

DateTime returntheDay(DateTime date) {
  // Add your function code here!
  var newDate = DateTime(date.year, date.month, date.day);
  return newDate;
}

DateTime getNextWeekday() {
  // Add your function code here!
  DateTime currentWeekday;
  DateTime nextWeekDate;
  final today = DateTime.now();

  if (today.weekday < 7) {
    nextWeekDate = today;
  } else {
    nextWeekDate = today.add(const Duration(days: 1));
  }

  return nextWeekDate;
}

DateTime returnDOB(
  BookingsRecord booking,
  DateTime statedateofbirth,
  bool dobEntered,
  bool isPatient,
) {
  // Add your function code here!
  DateTime date;
  // check if document boolean value is true, return datetime field, if false return current date
  //check if user is patient and set dob value if so
  if (isPatient) {
    date = booking.dOB;
  } else {
    //check if the user is not the patient but has entered the dob
    if (!isPatient && dobEntered) {
      date = statedateofbirth;
    } else {
      date = null;
    }
  }
  return date;
}

DateTime returnDOBLoader(
  BookingsRecord booking,
  bool isPatient,
) {
  // Add your function code here!
  DateTime date;
  // check if document boolean value is true, return datetime field, if false return current date
  //check if user is patient and set dob value if so
  if (isPatient) {
    date = booking.dOB;
  } else {
    //return null
    date = DateTime(1980, 1, 20);
  }
  return date;
}

bool displayDOBButton(
  BookingsRecord booking,
  bool stateIsPatient,
  DateTime stateDobVariable,
  bool stateVarIsSet,
) {
  bool result;
  if (!booking.userPatient) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

bool displayDOBField(
  BookingsRecord booking,
  bool stateIsPatient,
  DateTime stateDobVariable,
  bool stateVarIsSet,
) {
  bool result;
  if (!booking.userPatient && stateIsPatient) {
    if (stateVarIsSet) {
      result = true;
    } else {
      result = false;
    }
  } else {
    result = false;
  }
  return result;
}

String returnDateString(DateTime date) {
  // Add your function code here!
  var formatted = DateFormat('yMMMd').format(date);
  return formatted;
}

String dobButtonString(
  bool dobStateIsSet,
  DateTime dob,
) {
  var dobString;
  var formatted;
  if (dobStateIsSet) {
    dobString = DateFormat('yMMMd').format(dob);
  } else {
    dobString = 'Enter Date';
  }
  return dobString;
}

String scheduleButtonString(
  DateTime scheduleDate,
  DateTime nextWeekday,
) {
  var dobString;
  if (scheduleDate != null) {
    dobString = DateFormat('yMMMd').format(scheduleDate);
  } else {
    dobString = DateFormat('yMMMd').format(nextWeekday);
  }
  return dobString;
}

DateTime getNextDay(DateTime date) {
  DateTime nextDay = date.add(Duration(days: 1));
  return nextDay;
}

bool isTestBooked(
  DocumentReference testref,
  DocumentReference bookingref,
  List<BookedTestsRecord> bookedTests,
) {
  // check if document with matching parameters exists in list
  var found;
  var end = false;
  while (!end) {
    if (bookedTests.length > 0) {
      if (testref == bookedTests[0].testRef &&
          bookingref == bookedTests[0].bookingRef) {
        found = true;
        end = true;
      } else {
        found = false;
        end = true;
      }
    } else if (bookedTests.length == 0) {
      found = false;
      end = true;
    } else if (bookedTests.isEmpty) {
      return false;
    }
    bookedTests.removeAt(0);
  }
  return found;
}

bool isTestBookedCopy(
  DocumentReference testRef,
  DocumentReference bookingRef,
  List<BookedTestsRecord> bookedTests,
) {
  // check if a document with matching parametersexists in list
  for (BookedTestsRecord bookedTest in bookedTests) {
    if (testRef == bookedTest.testRef && bookingRef == bookedTest.bookingRef) {
      return true;
    }
  }
  ;
  return false;
}

String dateDay(DateTime date) {
  var formatted;
  formatted = DateFormat('d').format(date);
  return formatted;
}

String dateYear(DateTime date) {
  var formatted;
  formatted = DateFormat('y').format(date);
  return formatted;
}

String dateMonth(DateTime date) {
  var formatted;
  //formatted = DateFormat('MMM').format(date);
  formatted = DateFormat('MMM').format(date);
  return formatted;
}

int add1(int num) {
  return num + 1;
}

bool invoiceFullAmountBooking(
  double invoiceAmount,
  double bookingtotal,
) {
  // compare two numbers and return true if they are equal
  return (invoiceAmount == bookingtotal);
}

bool invoiceFullAmount(
  double invoiceAmount,
  double paymentAmount,
) {
  // compare two numbers and return true if they are equal
  return (invoiceAmount == paymentAmount);
}

String returnBookingListSize(List<BookingsRecord> tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = tests.length;
  }
  return numberOfElementsINlist.toString();
}

int returnTestListSizeCopy(List<DocumentReference> tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = 0;
  }
  return numberOfElementsINlist;
}

int returnBookedTestListSize(List<BookedTestsRecord> tests) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (tests.isNotEmpty) {
    numberOfElementsINlist = tests.length;
  } else {
    numberOfElementsINlist = 0;
  }
  return numberOfElementsINlist;
}

int returnInvoiceListSize(List<DocumentReference> invoices) {
  // return number of elements in list
  int numberOfElementsINlist;
  if (invoices.isNotEmpty) {
    numberOfElementsINlist = invoices.length;
  } else {
    numberOfElementsINlist = 0;
  }

  return numberOfElementsINlist;
}

List<BookingsRecord> returnTodayBookings(List<BookingsRecord> bookings) {
  // return list of documents with a date value today
  DateTime today = new DateTime.now();
  List<BookingsRecord> todayBookings = bookings.where((test) {
    if (DateTimeRange(start: test.scheduledDate, end: test.scheduledDate)
            .duration
            .compareTo(const Duration(days: 1)) ==
        0) {
      return true;
    } else {
      return false;
    }
  }).toList();

  return todayBookings;
}

int checkNewBookings(List<BookingsRecord> bookingsList) {
  // return the total number of documents with the same date as today
  int count = 0;
  DateTime today = DateTime.now();
  for (var i = 0; i < bookingsList.length; i++) {
    if (bookingsList[i].scheduledDate.day == today.day) {
      count += 1;
    }
  }
  return count;
}

int checkNewTests(List<BookedTestsRecord> testsList) {
  // return the total number of documents with the same date as today

  if (testsList.isNotEmpty) {
    int count = 0;
    DateTime today = DateTime.now();
    for (var i = 0; i < testsList.length; i++) {
      if (testsList[i].scheduledDate.day == today.day &&
          testsList[i].scheduledDate.month == today.month &&
          testsList[i].scheduledDate.year == today.year) {
        count += 1;
      }
    }
    return count;
  } else {
    return 0;
  }
}

double returnInvoiceAmountDue(
  double paymentAmount,
  double invoiceAmountDue,
) {
  // subtract two numbers and return the result
  return invoiceAmountDue - paymentAmount;
}

double returnBookingBalance(
  double paymentAmount,
  double bookingCurrentBalance,
) {
  // subtract two numbers and return the result
  return bookingCurrentBalance - paymentAmount;
}

String returnRef(DocumentReference testRef) {
  return testRef.id;
}

String returnRefCopy(DocumentReference testRef) {
  return testRef.id;
}

bool displayVerifyButton(
  bool isPosted,
  bool isVerified,
) {
  // return true if only one condition is true and return false if both conditions are true
  bool result;
  if ((isPosted) && (!isVerified)) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

List<UsersRecord> returnUserList(
  String nameQuery,
  List<UsersRecord> userList,
) {
  // filter firebase collection of documents by string if string is not null
  List<UsersRecord> list = <UsersRecord>[];
  if (nameQuery != null) {
    userList.forEach((user) {
      if (user.firstName != null &&
              user.firstName.toLowerCase().contains(nameQuery.toLowerCase()) ||
          user.lastName != null &&
              user.lastName.toLowerCase().contains(nameQuery.toLowerCase())) {
        list.add(user);
      }
    });
  } else {
    list.addAll(userList);
  }
  return list;
}

List<TestsRecord> returnSearchTests(
  String nameQuery,
  List<TestsRecord> testList,
) {
  // filter firebase collection of documents by string if string is not null
  List<TestsRecord> list = <TestsRecord>[];
  if (nameQuery != null) {
    testList.forEach((test) {
      if (test.name != null &&
          test.name.toLowerCase().contains(nameQuery.toLowerCase())) {
        list.add(test);
      }
    });
  } else {
    list.addAll(testList);
  }
  return list;
}

DocumentReference returnStaff(
  String displayName,
  List<StaffRecord> staffList,
) {
  // filter firebase collection of documents by string and return single document
  StaffRecord foundStaff = new StaffRecord();

  staffList.forEach((element) {
    if (element.displayName == displayName) {
      foundStaff = element;
    }
  });

  return foundStaff.reference;
}

List<UsersRecord> filterClients(List<UsersRecord> usersList) {
  // filter a list of documents based on a boolean value not true
  var result =
      List<UsersRecord>.from(usersList.where((e) => e.isStaff != true));
  return result;

  List<UsersRecord> list = <UsersRecord>[];
  usersList.forEach((user) {
    if (!user.isStaff) {
      list.add(user);
    }
  });
  return list;
}

bool displayUnverifiedTag(TestedTestsRecord testedTest) {
  // return boolean value based on two boolean fields in a document
  bool result;
  if (testedTest.resultPosted && !testedTest.isVerified) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

bool displayVerifiedTag(TestedTestsRecord testedTest) {
  // return boolean value based on two boolean fields in a document
  bool result;
  if (testedTest.resultPosted && testedTest.isVerified) {
    result = true;
  } else {
    result = false;
  }
  return result;
}

String camelCase(String name) {
  // return string formatted in sentence case
  bool startsWithUppercase = name[0] == name[0].toUpperCase();
  String string = (startsWithUppercase)
      ? name[0].toUpperCase() + name.substring(1).toLowerCase()
      : name.toLowerCase();
  List<String> splitName = string.split(" ");
  List<String> nameList = List();
  splitName.forEach((f) {
    if (f.length > 0) {
      nameList.add(f[0].toUpperCase() + f.substring(1));
    }
  });
  return nameList.join(" ");
}

String upperCase(String name) {
  // return string formatted in sentence case
  bool startsWithUppercase = name[0] == name[0].toUpperCase();
  String string = (startsWithUppercase)
      ? name[0].toUpperCase() + name.substring(1).toLowerCase()
      : name.toLowerCase();
  List<String> splitName = string.split(" ");
  List<String> nameList = List();
  splitName.forEach((f) {
    if (f.length > 0) {
      nameList.add(f[0].toUpperCase() + f.substring(1));
    }
  });
  return nameList.join(" ");
}

bool checkStringNull(String string) {
  // remove white spaces and check if a string value is null
  String data = string;
  if (string.isEmpty) {
    return true;
  } else {
    return false;
  }
}

bool allTestsConfirmed(
  int numTests,
  int testsConfirmed,
) {
  // if two numbers are not equal to zero, and equal, return true
  if ((numTests == 0.0 || testsConfirmed == 0.0) |
      !(numTests == testsConfirmed)) {
    print('num tests = $numTests');
    print('tests confirmed = $testsConfirmed');
    return false;
  } else {
    return true;
  }
}

int checkTestListSize(
  int listSize,
  int itemIndex,
) {
  // Add your function code here!
  if (listSize < 2) {
    return 0;
  } else {
    return itemIndex;
  }
}

int testsConfirmed(
  List<BookedTestsRecord> bookedTests,
  List<DocumentReference> bookingTests,
) {
  // check if all the elements in one list are contained in another list
  int numTests = 0;
  for (int i = 0; i < bookedTests.length; i++) {
    bool contains = false;
    for (int j = 0; j < bookingTests.length; j++) {
      if (bookedTests[i].testRef == bookingTests[j]) {
        contains = true;
        break;
      }
    }
    if (contains) numTests++;
  }
  return numTests;
}

DocumentReference returnBookedTest(
  DocumentReference bookingRef,
  DocumentReference testRef,
) {
  // query firebase collection for document that matches parameters
  var docs = FirebaseFirestore.instance
      .collection('booked-tests')
      .where(
        'bookingRef',
        isEqualTo: bookingRef,
      )
      .where(
        'testRef',
        isEqualTo: testRef,
      )
      .get()
      .then((snap) {
    return BookedTestsRecord().reference;
  });

  return BookedTestsRecord().reference;
}

bool returnBookedTestExists(
  DocumentReference bookingRef,
  DocumentReference testRef,
) {
  // query firebase collection for document that matches parameters
  var docs = FirebaseFirestore.instance
      .collection('booked-tests')
      .where(
        'bookingRef',
        isEqualTo: bookingRef,
      )
      .where(
        'testRef',
        isEqualTo: testRef,
      )
      .get()
      .then((snap) {
    return BookedTestsRecord();
  });
  if (BookedTestsRecord() != null) {
    return true;
  } else {
    return false;
  }
}

int stringToInt(String string) {
  // parse string to integer
  return int.parse(string);
}

double stringToDouble(String string) {
  // parse string to integer
  return double.parse(string);
}

TestedTestsRecord returnTestedTest(
  List<TestedTestsRecord> testedTests,
  DocumentReference bookedtestRef,
) {
  // query list for document with matching parameters
  final TestedTestsRecord toReturn =
      testedTests.firstWhere((TestedTestsRecord test) {
    return test.bookedTestRef != null
        ? test.bookedTestRef.path == bookedtestRef.path
        : false;
  }, orElse: () => null);
  return toReturn;
}

DocumentReference returnTestedTestRef(
  List<TestedTestsRecord> testedTests,
  DocumentReference bookedtestRef,
) {
  // query list for document with matching parameters
  final TestedTestsRecord toReturn =
      testedTests.firstWhere((TestedTestsRecord test) {
    return test.bookedTestRef != null
        ? test.bookedTestRef.path == bookedtestRef.path
        : false;
  }, orElse: () => null);
  return toReturn.reference;
}

bool testedTestSubmitted(TestedTestsRecord testedtest) {
  // check if parameter is true
  if (testedtest == null) {
    return false;
  } else if (testedtest.resultPosted) {
    return true;
  } else {
    return false;
  }
}

bool testedTestVerified(TestedTestsRecord testedtest) {
  // check if parameter is true
  if (testedtest == null) {
    return false;
  } else if (testedtest.isVerified) {
    return true;
  } else {
    return false;
  }
}

List<BookingsRecord> filterDayBookings(
  List<BookingsRecord> calendarBookings,
  DateTime calendarDate,
) {
  // return all documents with same day
  List<BookingsRecord> dayBookings = calendarBookings
      .where((booking) => booking.scheduledDate.day == calendarDate.day)
      .toList();
  return dayBookings;
}

List<BookedTestsRecord> filterDayTests(
  List<BookedTestsRecord> calendarTests,
  DateTime calendarDate,
) {
  // return all documents with same day
  List<BookedTestsRecord> dayBookings = calendarTests
      .where((bookedTest) => bookedTest.scheduledDate.day == calendarDate.day)
      .toList();
  return dayBookings;
}

int getDayTestsnumber(
  List<BookedTestsRecord> calendarTests,
  DateTime calendarDate,
) {
  // return all documents with same day
  List<BookedTestsRecord> dayBookings = calendarTests
      .where((bookedTest) => bookedTest.scheduledDate.day == calendarDate.day)
      .toList();
  return dayBookings.length;
}

bool checkAllTestVerified(
  List<BookedTestsRecord> bookedTests,
  List<TestedTestsRecord> verifiedTests,
) {
  // check if all documents in one list have a corresponding document in another list
  if (bookedTests.isEmpty && verifiedTests.isEmpty) return true;
  if (bookedTests.length == verifiedTests.length) {
    for (int i = 0; i < bookedTests.length; i++) {
      if (!verifiedTests
          .map((item) => item.bookedTestRef)
          .contains(bookedTests[i].reference)) {
        return false;
      }
    }
    return true;
  } else {
    return false;
  }
}

bool checktestsListsEqual(
  List<DocumentReference> bookingTests,
  List<DocumentReference> bookedTests,
) {
  // check if two lists contain the same elements
  if (bookingTests == null && bookedTests == null) return false;
  bool res = true;
  if (bookingTests.length != bookedTests.length) res = false;
  for (int i = 0; i < bookingTests.length; i++) {
    res = res && bookingTests.contains(bookedTests[i]);
  }
  return res;
}

DateTime setInvoiceDueDate(DateTime datePicked) {
  // if datetime parameter is null, return next day from current timestamp
  if (datePicked == null)
    return DateTime.now().add(Duration(days: 1));
  else
    return datePicked;
}

bool isCategorySelected(String categoryLocalState) {
  // return true if string variable is "all"
  if (categoryLocalState.toLowerCase == 'All') {
    return true;
  } else
    return false;
}

bool isThisCategorySelected(
  String categoryLocalState,
  String categoryString,
) {
  // return true if string variable is "all"
  if (categoryLocalState.toLowerCase == categoryString.toLowerCase) {
    return true;
  } else
    return false;
}

List<TestsRecord> filterTests(
  bool allcategories,
  String catString,
  String searchQuery,
  List<TestsRecord> allTests,
) {
  // filter collection by category parameter if boolean value true
  //
  if (allcategories) {
    if (searchQuery.isNotEmpty) {
      return allTests.where((t) => t.name.contains(searchQuery)).toList();
    } else {
      return allTests
          .where((t) => t.category.toLowerCase() == catString.toLowerCase())
          .toList();
    }
  } else {
    if (searchQuery.isNotEmpty && !allcategories) {
      return allTests
          .where((t) =>
              t.name.contains(searchQuery) &&
              t.category.toLowerCase() == catString.toLowerCase())
          .toList();
    } else {
      return allTests;
    }
  }
}

List<TestsRecord> filterTestsByCategory(
  bool allcategories,
  String catString,
  List<TestsRecord> allTests,
) {
  // filter collection by category parameter if boolean value true
  final List<TestsRecord> filteredList = [];
  if (catString.isNotEmpty) {
    for (int i = 0; i < allTests.length; i++) {
      if (allcategories == true) {
        filteredList.add(allTests[i]);
      } else if (allcategories == false) {
        if (allTests[i].category.toLowerCase() == catString.toLowerCase()) {
          filteredList.add(allTests[i]);
        }
      }
    }
    return filteredList;
  } else if (catString = null) {
    return allTests;
  } else {
    return allTests;
  }
}

String returnNewTestsifZero(int tests) {
  // if list is empty or null return string
  String _returnThis;
  if (tests > 0)
    // something
    _returnThis = tests.toString();
  else
    _returnThis = '0';
  return _returnThis;
}

bool userHasStaffRecord(
  DocumentReference userRef,
  List<StaffRecord> staffList,
) {
  // check list for record with a matching userRef field and return true if found
  if (userRef == null) {
    return false;
  }
  for (var staff in staffList) {
    if (staff.userRef == userRef) {
      return true;
    }
  }
  return false;
}

int createUniqueId() {
  return DateTime.now().millisecondsSinceEpoch.remainder(100000);
}

bool bookingValidation(
  String fName,
  String lName,
  String email,
  String phone,
  String sex,
  List<DocumentReference> tests,
) {
  // validate form entries
  // missing entries:
  if (fName.isEmpty ||
      lName.isEmpty ||
      email.isEmpty ||
      sex.isEmpty ||
      tests.isEmpty) {
    return false;
  } else {
    return true;
  }
}

String bookingValidator(
  String fName,
  String lName,
  String email,
  String phone,
  String sex,
  List<DocumentReference> tests,
) {
  // validate form entries
  // missing entries:
  String err;
  if (fName.isEmpty) {
    err = err + "fName";
  }
  if (lName.isEmpty) {
    err = err + "lName";
  }
  if (email.isEmpty) {
    err = err + "email";
  }
  if (sex.isEmpty) {
    err = err + "sex";
  }
  if (tests.isEmpty) {
    err = err + "tests";
  }
  return err;
}

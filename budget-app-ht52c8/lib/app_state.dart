import 'package:flutter/material.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _transaction = prefs
              .getStringList('ff_transaction')
              ?.map((x) {
                try {
                  return TransactionsStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _transaction;
    });
    _safeInit(() {
      _categories = prefs
              .getStringList('ff_categories')
              ?.map((x) {
                try {
                  return CategoriesStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _categories;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<TransactionsStruct> _transaction = [];
  List<TransactionsStruct> get transaction => _transaction;
  set transaction(List<TransactionsStruct> value) {
    _transaction = value;
    prefs.setStringList(
        'ff_transaction', value.map((x) => x.serialize()).toList());
  }

  void addToTransaction(TransactionsStruct value) {
    transaction.add(value);
    prefs.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void removeFromTransaction(TransactionsStruct value) {
    transaction.remove(value);
    prefs.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromTransaction(int index) {
    transaction.removeAt(index);
    prefs.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void updateTransactionAtIndex(
    int index,
    TransactionsStruct Function(TransactionsStruct) updateFn,
  ) {
    transaction[index] = updateFn(_transaction[index]);
    prefs.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInTransaction(int index, TransactionsStruct value) {
    transaction.insert(index, value);
    prefs.setStringList(
        'ff_transaction', _transaction.map((x) => x.serialize()).toList());
  }

  List<CategoriesStruct> _categories = [
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"1\",\"name\":\"salary\",\"image\":\"https://cdn-icons-png.flaticon.com/128/12740/12740855.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"2\",\"name\":\"bonus\",\"image\":\"https://cdn-icons-png.flaticon.com/128/3135/3135706.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"3\",\"name\":\"rent\",\"image\":\"https://cdn-icons-png.flaticon.com/128/580/580670.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"4\",\"name\":\"groceries\",\"image\":\"https://cdn-icons-png.flaticon.com/128/1261/1261163.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"5\",\"name\":\"loans\",\"image\":\"https://cdn-icons-png.flaticon.com/128/1538/1538293.png\"}')),
    CategoriesStruct.fromSerializableMap(jsonDecode(
        '{\"id\":\"6\",\"name\":\"education\",\"image\":\"https://cdn-icons-png.flaticon.com/128/3976/3976625.png\"}'))
  ];
  List<CategoriesStruct> get categories => _categories;
  set categories(List<CategoriesStruct> value) {
    _categories = value;
    prefs.setStringList(
        'ff_categories', value.map((x) => x.serialize()).toList());
  }

  void addToCategories(CategoriesStruct value) {
    categories.add(value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeFromCategories(CategoriesStruct value) {
    categories.remove(value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromCategories(int index) {
    categories.removeAt(index);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void updateCategoriesAtIndex(
    int index,
    CategoriesStruct Function(CategoriesStruct) updateFn,
  ) {
    categories[index] = updateFn(_categories[index]);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInCategories(int index, CategoriesStruct value) {
    categories.insert(index, value);
    prefs.setStringList(
        'ff_categories', _categories.map((x) => x.serialize()).toList());
  }

  int _selectedcategory = 0;
  int get selectedcategory => _selectedcategory;
  set selectedcategory(int value) {
    _selectedcategory = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

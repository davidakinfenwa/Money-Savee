import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_saver/features/home/data/model/create_activity_model.dart';

int totals = 0;

final box = Hive.box<Create>('data');

int total() {
  var history = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history.length; i++) {
    a.add(history[i].IN == 'Income'
        ? int.parse(history[i].amount!)
        : int.parse(history[i].amount!) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int income() {
  var history = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history.length; i++) {
    a.add(history[i].IN == 'Income' ? int.parse(history[i].amount!) : 0);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

int expense() {
  var history = box.values.toList();
  List a = [0, 0];
  for (var i = 0; i < history.length; i++) {
    a.add(history[i].IN == 'Income' ? 0 : int.parse(history[i].amount!) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List<Create> today() {
  var history = box.values.toList();
  List<Create> a = [];
  DateTime todayDate = DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].dateCreated!.day == todayDate.day) {
      a.add(history[i]);
    }
  }
  return a;
}

List<Create> week() {
  var history = box.values.toList();
  List<Create> a = [];
  DateTime todayDate = DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (todayDate.day - 7 <= history[i].dateCreated!.day &&
        history[i].dateCreated!.day <= todayDate.day) {
      a.add(history[i]);
    }
  }
  return a;
}

List<Create> month() {
  var history = box.values.toList();
  List<Create> a = [];
  DateTime todayDate = DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].dateCreated!.month == todayDate.month) {
      a.add(history[i]);
    }
  }
  return a;
}

List<Create> year() {
  var history = box.values.toList();
  List<Create> a = [];
  DateTime todayDate = DateTime.now();
  for (var i = 0; i < history.length; i++) {
    if (history[i].dateCreated!.year == todayDate.year) {
      a.add(history[i]);
    }
  }
  return a;
}

int totalChart(List<Create> history) {

  List a = [0, 0];
  for (var i = 0; i < history.length; i++) {
    a.add(history[i].IN == 'Income'
        ? int.parse(history[i].amount!)
        : int.parse(history[i].amount!) * -1);
  }
  totals = a.reduce((value, element) => value + element);
  return totals;
}

List timeer(List<Create> history, bool hour) {
  List<Create> a = [];
  List total = [0, 0];
  int counter = 0;
  for (var c = 0; c < history.length; c++) {
    for (var i = c; i < history.length; i++) {
      if (hour) {
        if (history[i].dateCreated!.hour == history[c].dateCreated!.hour) {
          a.add(history[i]);
          counter = i;
        }
      } else {
        if (history[i].dateCreated!.day == history[c].dateCreated!.day) {
          a.add(history[i]);
          counter = i;
        }
      }
    }
    total.add(totalChart(a));
    a.clear();
    c = counter;
  }
  return total;
}

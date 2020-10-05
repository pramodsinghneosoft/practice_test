import 'dart:async';

class ContactManager {
  Stream<List<String>> get contactlistNow async* {
    for (int i = 0; i < contactsList.length; i++) {
      await Future.delayed(Duration(seconds: 2));
      yield contactsList.sublist(0, i + 1);
    }
  }

  // counter value
  final StreamController<int> _contactCounter = StreamController<int>();
  Stream<int> get contactCounter => _contactCounter.stream;
  ContactManager() {
    contactlistNow.listen((list) => _contactCounter.add(list.length));
  }
}

List<String> contactsList = [
  "User 1",
  "User 2",
  "User 3",
  "User 4",
];

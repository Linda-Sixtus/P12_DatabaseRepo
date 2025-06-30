
//_____----_______----_______________Aufgabe 2

import 'dart:ffi';
import "dart:io";

abstract class DatabaseRepository {
  List<SunimoMessage> Read();
  bool Create(SunimoMessage message);
  bool Update(SunimoMessage message);
  bool Delete(SunimoMessage message);
}

class SunimoMessage {
  String? message;
  int? messageId;
}

//_____----_______----_______________Aufgabe 3


class MockDatabaseRepository implements DatabaseRepository {
  List<String> messages = [];

  @override
  void sendMessage(String m) {
    messages.add(m);
  }
  @override
  List<String> getMessages() {
    return messageList;
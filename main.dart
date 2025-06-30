//_____----_______----_______________Aufgabe 2

import 'dart:ffi';
import "dart:io";

abstract class DatabaseRepository {
  List<Message?> getMessages();
  bool sendMessage(Message message);
  bool updateMessage(String id, String newMessage);
  bool deleteMessage(String id);
}

class Message {
  String? message;
  String? messageId;
}

//_____----_______----_______________Aufgabe 3

abstract class MockDatabaseRepository implements DatabaseRepository {
  List<Message?> messages = [];

  @override
  bool sendMessage(Message m) {
    messages.add(m);

    return true; // Eventuell Fehler abfragen, dann false senden
  }

  @override
  List<Message?> getMessages() {
    return messages;
  }

  @override
  bool updateMessage(String id, String newMessage) {
    Message? message = messages.firstWhere(
      (message) => message?.messageId == id,
    );
    if (message == null) {
      return false;
    }
    message.message = newMessage;
    return true;
  }

  @override
  bool deleteMessage(String id) {
    Message? message = messages.firstWhere(
      (message) => message?.messageId == id,
    );
    if (message == null) {
      return false;
    }
    messages.remove(message);
    return true;
  }
}

import 'dart:html';

class Globals {
  String? name, email, address, password, contact;
  File? image;

  static final Globals globals = Globals();

  void reset() {
    name = contact = email = password = address = null;
  }
}

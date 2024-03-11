import 'dart:io';

class Globals {
  String? name, email, address, password, contact;
  File? image;
  String? gender;
  static final Globals globals = Globals();

  void reset() {
    name = contact = email = password = address = null;
  }
}

class Globals {
  String? name, email, address, password, contact;

  static final Globals globals = Globals();

  void reset() {
    name = contact = email = password = address = null;
  }
}

class Client {
  String? key, name, contact;

  Client(this.key, this.name, this.contact);

  static Client fromjson(Map m, String key) {
    return Client(key, m['name'], m['contact']);
  }
}

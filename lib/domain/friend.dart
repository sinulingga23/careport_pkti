class Friend {
  String name;
  String description;
  String path;

  Friend(String name, String description, String path) {
    this.name = name;
    this.description = description;
    this.path = path;
  }

  String getName() {
    return this.name;
  }

  String getDescription() {
    return this.description;
  }

  String getPath() {
    return this.path;
  }
}
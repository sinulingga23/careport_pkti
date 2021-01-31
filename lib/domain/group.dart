class Group {
  String title;
  String description;
  String path;

  Group(String title, String description, String path) {
    this.title = title;
    this.description = description;
    this.path = path;
  }

  String getTitle() {
    return this.title;
  }

  String getDescription() {
    return this.description;
  }

  String getPath() {
    return this.path;
  }
}
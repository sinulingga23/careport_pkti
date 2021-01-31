class Article {
  String title;
  String description;
  String path;

  
  Article(String title, String description, path) {
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
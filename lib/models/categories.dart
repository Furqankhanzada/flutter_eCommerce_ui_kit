class Category {
  int term_id;
  String name;
  String slug;
  int term_group;
  int term_taxonomy_id;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  Category({this.term_id, this.name, this.slug, this.term_group, this.term_taxonomy_id, this.taxonomy, this.description, this.parent, this.count, this.filter});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
    term_id: json['term_id'],
    name: json['name'],
    slug: json['slug'],
    term_group: json['term_group'],
      term_taxonomy_id: json['term_taxonomy_id'],
      taxonomy: json['taxonomy'],
      description: json['description'],
      parent: json['parent'],
      count: json['count'],
      filter: json['filter']
    );
 }
}

class UserCredential {
  String usernameOrEmail;
  String password;
  UserCredential({this.usernameOrEmail, this.password});
}

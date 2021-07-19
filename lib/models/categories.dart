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
  Category({required this.term_id, required this.name, required this.slug, required this.term_group, required this.term_taxonomy_id, required this.taxonomy, required this.description, required this.parent, required this.count, required this.filter});
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
  UserCredential({required this.usernameOrEmail, required this.password});
}

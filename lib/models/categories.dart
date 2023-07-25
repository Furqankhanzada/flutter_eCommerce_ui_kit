class Category {
  int termId;
  String name;
  String slug;
  int termGroup;
  int termTaxonomyId;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  Category({required this.termId, required this.name, required this.slug, required this.termGroup, required this.termTaxonomyId, required this.taxonomy, required this.description, required this.parent, required this.count, required this.filter});
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
    termId: json['term_id'],
    name: json['name'],
    slug: json['slug'],
    termGroup: json['term_group'],
      termTaxonomyId: json['term_taxonomy_id'],
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

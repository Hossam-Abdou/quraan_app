class AzkarModel
{
  String?a;
  List<B>?b;


  AzkarModel({this.a, this.b});
  AzkarModel.fromJson(Map<String, dynamic> json) {
    a = json['أذكار الصباح'];
    if (json['أذكار المساء'] != null) {
      b = <B>[];
      json['أذكار المساء'].forEach((v) {
        b!.add(new B.fromJson(v));
      });
    }  }
}
class B
{
  String? category;
  String? count;
  String? description;
  String? reference;
  String? content;
  B({
      this.category,
      this.count,
      this.description,
      this.reference,
      this.content});
  B.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    count = json['count'];
    description = json['description'];
    reference = json['reference'];
    content = json['content'];
  }
}


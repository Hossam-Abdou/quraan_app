class AzkarDetailsModel
{
  int? sectionId;
  String? description;
  String? count;
  String? reference;
  String? content;
  AzkarDetailsModel(this.sectionId, this.description,this.content,this.count,this.reference);

  AzkarDetailsModel.fromJson(Map<String, dynamic> json) {
    sectionId = json["section_id"];
    description = json["description"];
    content = json["content"];
    count = json["count"];
    reference=json["reference"];


  }
}
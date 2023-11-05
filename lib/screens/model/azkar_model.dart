class AzkarModel {
  int? id;
  String? name;
  AzkarModel(this.id, this.name);

  AzkarModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}




class QuraanModel {
  int? id;
  String? name;
  String? name_translation;
  String? ar;
  String? type;
  List <Array>? array;
  QuraanModel(this.id, this.name,this.ar,this.type,this.name_translation,this.array);

  QuraanModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    name_translation = json["name_translation"];
    ar = json["ar"];
    type = json["type"];
    if (json['array'] != null) {
      array = <Array>[];
      json['array'].forEach((v) {
        array!.add(new Array.fromJson(v));
      });
    }

  }

}
class Array{
  int? id;
  String? path;
  String? filename;

  Array({this.id, this.path, this.filename});

  Array.fromJson(Map<String, dynamic> json)
  {
    id = json["id"];
    path = json["path"];
    filename = json["filename"];
  }

  }
// class SurahModel {
//   int? code;
//   String? status;
//   List<Data>? data;
//
//   SurahModel({this.code, this.status, this.data});
//
//   SurahModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(Data.fromJson(v));
//       });
//     }
//   }
//
// }
//
// class Data {
//   int? number;
//   String? name;
//   String? englishName;
//   String? englishNameTranslation;
//   int? numberOfAyahs;
//   String? revelationType;
//
//   Data(
//       {this.number,
//         this.name,
//         this.englishName,
//         this.englishNameTranslation,
//         this.numberOfAyahs,
//         this.revelationType});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     name = json['name'];
//     englishName = json['englishName'];
//     englishNameTranslation = json['englishNameTranslation'];
//     numberOfAyahs = json['numberOfAyahs'];
//     revelationType = json['revelationType'];
//   }
//
//
//
// }
// class Ayahs {
//   int? number;
//   String? text;
//   int? numberInSurah;
//   int? juz;
//   int? manzil;
//   int? page;
//   int? ruku;
//   int? hizbQuarter;
//   bool? sajda;
//
//   Ayahs(
//       {this.number,
//         this.text,
//         this.numberInSurah,
//         this.juz,
//         this.manzil,
//         this.page,
//         this.ruku,
//         this.hizbQuarter,
//         this.sajda});
//
//   Ayahs.fromJson(Map<String, dynamic> json) {
//     number = json['number'];
//     text = json['text'];
//     numberInSurah = json['numberInSurah'];
//     juz = json['juz'];
//     manzil = json['manzil'];
//     page = json['page'];
//     ruku = json['ruku'];
//     hizbQuarter = json['hizbQuarter'];
//     sajda = json['sajda'];
//   }
//
// }
//
// class Edition {
//   String? identifier;
//   String? language;
//   String? name;
//   String? englishName;
//   String? format;
//   String? type;
//   String? direction;
//
//   Edition(
//       {this.identifier,
//         this.language,
//         this.name,
//         this.englishName,
//         this.format,
//         this.type,
//         this.direction});
//
//   Edition.fromJson(Map<String, dynamic> json) {
//     identifier = json['identifier'];
//     language = json['language'];
//     name = json['name'];
//     englishName = json['englishName'];
//     format = json['format'];
//     type = json['type'];
//     direction = json['direction'];
//   }
//
// }
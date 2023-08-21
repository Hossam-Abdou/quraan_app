import 'dart:convert';

class Verse {
  int? chapter;
  int? verse;
  String? text;

  Verse({this.chapter, this.verse, this.text});
}
List<Verse> parseVerses(String jsonStr) {
  final parsed = json.decode(jsonStr);
  final verses = List<Verse>.from(parsed.values.expand((v) => v));

  return verses;
}
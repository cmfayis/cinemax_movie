class TrailerModel {
  late List<TResult> results;

  TrailerModel({required this.results});

  factory TrailerModel.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['results'] as List;
    List<TResult> resultList =
        list.map((i) => TResult.fromJson(i)).toList();

    return TrailerModel(results: resultList);
  }
}

class TResult {
  late String key;
  late String name;

  TResult({required this.key, required this.name});

  factory TResult.fromJson(Map<String, dynamic> json) {
    return TResult(
      key: json['key'],
      name: json['name'],
    );
  }
}
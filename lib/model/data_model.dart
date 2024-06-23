class DataModel{
  String? shlok;
  String? hindi;
  String? guj;
  String? eng;

  DataModel({this.shlok, this.hindi, this.guj, this.eng});

  factory DataModel.fromJson(Map json){
    return DataModel(
      shlok: json['shlok'],
      hindi: json['hindi'],
      guj: json['guj'],
      eng: json['eng'],
    );
  }
}
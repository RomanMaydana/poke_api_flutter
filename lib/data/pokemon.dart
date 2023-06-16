
class Pokemon{

  Pokemon({required this.name,required this.url});
  final String name;
  final String url;

  // final map = {
  //  "name": "Roman",
  //  "edad": 40
  // }
  // map['name']
  // map['direccion'] -> null

  factory Pokemon.fromJson(Map<String, dynamic> json){
    return Pokemon(
      name: json['name'] ,
      url: json['url']
    );
  }

  

  
}
class Plant {
  String name;
  String description;
  String qrCode;


  Plant(this.name, this.description, this.qrCode);

  factory Plant.fromJson(Map<String,dynamic>json){
    return Plant(json['name'],json['description'],json['qrCode']);
  }


}
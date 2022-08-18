import '../../domain/entities/rcharacter_entitie.dart';

class RcharacterEntitieModel extends RcharacterEntitie {
  const RcharacterEntitieModel({super.id, super.name, super.status, super.species, super.gender, super.image, super.created, super.type});

  factory RcharacterEntitieModel.fromMap(Map<String, dynamic> json) => RcharacterEntitieModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        gender: json['gender'],
        image: json['image'],
        created: json['created'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['gender'] = gender;
    data['image'] = image;
    data['created'] = created;
    data['type'] = type;
    return data;
  }
}

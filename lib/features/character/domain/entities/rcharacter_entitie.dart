import 'package:equatable/equatable.dart';

class RcharacterEntitie extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;
  final String? image;
  final String? created;
  final String? type;

  const RcharacterEntitie({this.id, this.name, this.status, this.species, this.gender, this.image, this.created, this.type});

  @override
  List<Object?> get props => [id, name, status, species, gender, image, created,type];
}

import '/core/network/network_request.dart';
import 'package:equatable/equatable.dart';

// name: filter by the given name.
// status: filter by the given status (alive, dead or unknown).
// species: filter by the given species. (Human)
// gender: filter by the given gender (female, male, genderless or unknown).

class QueryParameters extends Equatable implements NetworkRequest {
  final int? page;
  final String? name;
  final String? status;
  final String? species;
  final String? gender;

  const QueryParameters({this.page, this.name, this.status, this.species, this.gender});

  _map() {
    Map<String, dynamic> _map = <String, dynamic>{};
    if (page != null && page != null) _map["page"] = page;
    if (name != null && name != null) _map["name"] = name;
    if (status != null && status != null) _map["status"] = status;
    if (species != null && species != null) _map["species"] = species;
    if (gender != null && gender != null) _map["gender"] = gender;
    if (name != null && name != null) _map["name"] = name;
    if (name != null && name != null) _map["name"] = name;
    return _map;
  }

  @override
  toMap() => _map();

  @override
  List<Object?> get props => [page, name, status, species, gender];
}

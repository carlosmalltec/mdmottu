import 'package:equatable/equatable.dart';

import '../rcharacter_entitie.dart';


class ResponseCharacterEntitie extends Equatable {
  final int? count;
  final int? pages;
  final List<RcharacterEntitie>? model;
  final int? statusCode;
  final String? statusMessage;
  final String? errorMessage;

  const ResponseCharacterEntitie({this.count, this.pages, this.statusCode, this.statusMessage, this.errorMessage, this.model});

  @override
  List<Object?> get props => [statusCode, statusMessage, errorMessage, model];
}

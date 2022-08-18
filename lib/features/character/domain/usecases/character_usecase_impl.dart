import 'package:dartz/dartz.dart';
import 'package:mdmottu/features/character/domain/entities/network/response_character_entitie.dart';
import 'package:mdmottu/core/network/query_parameters.dart';

import '../repositories/character_repository.dart';
import '/core/network/failures/failures.dart';
import '/core/network/failures/failures_generic.dart';
import 'character_usecase.dart';



class CharacterUsecaseImpl implements CharacterUsecase {
  final CharacterRepository repository;

  CharacterUsecaseImpl(this.repository);

  @override
  Future<Either<Failures, ResponseCharacterEntitie>> findCharacterUsecase(QueryParameters? queryParameters) async {
    try {
      return repository.findAllCharacterRepository(queryParameters);
    } catch (e) {
      return left(FailureGeneric(message: 'Falha de sistema, não foi possível efetuar a listagem'));
    }
  }
}

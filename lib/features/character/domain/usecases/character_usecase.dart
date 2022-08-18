
import '../../../../core/network/query_parameters.dart';
import '../entities/network/response_character_entitie.dart';
import '/core/network/failures/failures.dart';

import 'package:dartz/dartz.dart';


abstract class CharacterUsecase {
  Future<Either<Failures, ResponseCharacterEntitie>> findCharacterUsecase(QueryParameters? queryParameters);
}

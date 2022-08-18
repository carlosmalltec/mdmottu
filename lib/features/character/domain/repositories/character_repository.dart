
import 'package:dartz/dartz.dart';

import '../../../../core/network/failures/failures.dart';
import '../../../../core/network/query_parameters.dart';
import '../entities/network/response_character_entitie.dart';


abstract class CharacterRepository {
  Future<Either<Failures, ResponseCharacterEntitie>> findAllCharacterRepository(QueryParameters? queryParameters);
}


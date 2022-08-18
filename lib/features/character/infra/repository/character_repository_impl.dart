import 'package:dartz/dartz.dart';
import 'package:mdmottu/features/character/domain/entities/network/response_character_entitie.dart';
import 'package:mdmottu/core/network/query_parameters.dart';

import '../../domain/repositories/character_repository.dart';
import '../datasources/character_datasource.dart';
import '/core/network/failures/datasource_error.dart';
import '/core/network/failures/failures.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  final CharacterDatasource datasource;

  CharacterRepositoryImpl(this.datasource);

  @override
  Future<Either<Failures, ResponseCharacterEntitie>> findAllCharacterRepository(QueryParameters? queryParameters) async {
    try {
      final result = await datasource.findAllCharacterDatasource(parameters: queryParameters);
      return right(result);
    } on DatasourceError catch (e) {
      return left(e);
    } catch (e) {
      return left(DatasourceError(message: 'Não foi possível solicitar os dados para o servidor'));
    }
  }
}

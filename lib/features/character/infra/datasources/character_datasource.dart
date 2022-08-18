import '../../../../core/network/query_parameters.dart';
import '../models/network/response_character_model.dart';

abstract class CharacterDatasource {
  Future<ResponseCharacterModel> findAllCharacterDatasource({QueryParameters? parameters});
}

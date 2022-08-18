import '../../../domain/entities/network/response_character_entitie.dart';
import '../character_model.dart';

class ResponseCharacterModel extends ResponseCharacterEntitie {
  const ResponseCharacterModel({
    statusCode,
    statusMessage,
    errorMessage,
    count,
    pages,
    required model,
  }) : super(
          count: count,
          pages: pages,
          model: model,
          errorMessage: errorMessage,
          statusMessage: statusMessage,
          statusCode: statusCode,
        );

  factory ResponseCharacterModel.fromMap({
    List<dynamic>? data,
    int? statusCode,
    String? statusMessage,
    String? errorMessage,
    int? count,
    int? pages,
  }) {
    return ResponseCharacterModel(
      count: count,
      pages: pages,
      model: data?.map<RcharacterEntitieModel>((data) => RcharacterEntitieModel.fromMap(data)).toList() ?? [],
      statusCode: statusCode,
      statusMessage: statusMessage,
      errorMessage: errorMessage,
    );
  }
}

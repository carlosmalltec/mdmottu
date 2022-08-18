import 'package:mdmottu/constants/const_strings.dart';
import 'package:mdmottu/features/character/infra/models/network/response_character_model.dart';

import 'package:mdmottu/core/network/query_parameters.dart';
import 'package:mdmottu/lang/app_translation.dart';

import '../../../../constants/const_path.dart';
import '../../../../core/network/network.dart';
import '../../infra/datasources/character_datasource.dart';

class CharacterDatasourceImpl implements CharacterDatasource {
  final Network _network;
  CharacterDatasourceImpl(this._network);

  @override
  Future<ResponseCharacterModel> findAllCharacterDatasource({QueryParameters? parameters}) async {
    try {
      final resp = await _network.get(ConstPath.character, body: parameters);
      if (resp.statusCode == null || resp.statusCode == 503 || resp.statusCode == 504) {
        return ResponseCharacterModel.fromMap(
          pages: 0,
          count: 0,
          statusCode: ConstStrings.statusCode,
          data: const [],
          statusMessage: AppTranslationString.string(ConstStrings.statusMessage),
        );
      }
      return ResponseCharacterModel.fromMap(
        statusCode: resp.statusCode,
        statusMessage: resp.statusMessage,
        data: resp.data['results'],
        pages: resp.data['info']['pages'],
        count: resp.data['info']['count'],
      );
    } catch (e) {
      return ResponseCharacterModel.fromMap(
        statusCode: ConstStrings.statusCode,
        data: const [],
        statusMessage: e.toString(),
        pages: 0,
        count: 0,
      );
    }
  }

  // @override
  // Future<ResponseExamsExt> findAllExamsDatasource(int pacientId, QueryParameters parameters) async {
  //   try {
  //     final response = await _network.get(AppUrl.findAllExamsPatientId(pacientId), isAuth: true, body: parameters);
  //     if (response.statusCode == null) return ResponseExamsExt.fromMap(statusCode: STATUS_CODE_DEFAULT, data: const [], statusMessage: STATUS_MESSAGE_DEFAULT);
  //     var statusMessage = response.statusMessage ?? STATUS_MESSAGE_DEFAULT;
  //     var statusCode = response.statusCode ?? STATUS_CODE_DEFAULT;
  //     return ResponseExamsExt.fromMap(statusCode: statusCode, data: response.data, statusMessage: statusMessage);
  //   } catch (e) {
  //     return ResponseExamsExt.fromMap(statusCode: STATUS_CODE_DEFAULT, data: const [], statusMessage: e.toString());
  //   }
  // }
}

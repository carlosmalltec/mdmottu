import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';
import 'package:mdmottu/core/enum/status_loading.dart';
import 'package:mdmottu/core/scaffold_app/widgets/snack_bar_success.dart';
import 'package:mdmottu/lang/app_translation.dart';

import '../../../../core/network/check_connecting_network.dart';
import '../../../../core/network/query_parameters.dart';
import '../../external/datasource/character_datasource_impl.dart';
import '../../infra/models/character_model.dart';
import '../../infra/models/network/response_character_model.dart';

class CharacterController extends ChangeNotifier {
  final CharacterDatasourceImpl request;
  final CheckConnectingNetwork connectingNetwork;

  CharacterController(this.request, this.connectingNetwork);

  final ValueNotifier<bool> _isLoadingPagination = ValueNotifier(false);
  final ValueNotifier<int> _pageNext = ValueNotifier(1);
  static const _loadMorePageConst = 0.9;
  static const _page = 1;
  static const _index = 9999999;

  final ValueNotifier<StatusLoading> isLoading = ValueNotifier(StatusLoading.notLoading);
  final ValueNotifier<List<RcharacterEntitieModel>> listResult = ValueNotifier<List<RcharacterEntitieModel>>([]);

  final ValueNotifier isExpandedIndex = ValueNotifier(_index);


  void Function(int, bool)? expansionCallback(int index, bool isExpanded) {
    if (isExpanded) {
      isExpandedIndex.value = _index;
      notifyListeners();
    } else {
      isExpandedIndex.value = index;
      notifyListeners();
    }
    return null;
  }

  String dateFormat(String? dataLocal) {
    try {
      if (dataLocal == null) return "--";
      DateTime d = DateTime.parse(dataLocal.toString());
      return "${d.day}/${d.month}/${d.year} ás ${d.hour}:${d.minute}";
    } catch (e) {
      return "--";
    }
  }

  getFirst({isFirst = false}) async {
    if (isFirst) {
      isLoading.value = StatusLoading.shimmerLoading;
    } else {
      isLoading.value = StatusLoading.fullLoading;
    }
    _pageNext.value = _page;
    listResult.value.clear();
    notifyListeners();
    await _getDataCharacter();
  }

  swipeRefresh() async {
    await getFirst(isFirst: true);
  }

  onScroll(double scrollPosition, double scrollMax) async {
    if (_isLoadingPagination.value) return;
    if (scrollPosition > scrollMax * _loadMorePageConst) {
      _isLoadingPagination.value = false;
      await getNextPage();
    }
  }

  getNextPage() async {
    if (isLoading.value != StatusLoading.notLoading) return;
    isLoading.value = StatusLoading.nextPageLoading;
    notifyListeners();
    await _getDataCharacter();
  }

  _getDataCharacter() async {
    try {
      bool isConnected = await connectingNetwork.appCheckConnectivity();
      if (!isConnected) {
        isLoading.value = StatusLoading.notConnecting;
        notifyListeners();
        snackBarWarning(text: 'failure_network');
        return;
      }

      QueryParameters parameters = QueryParameters(page: _pageNext.value);
      ResponseCharacterModel resp = await request.findAllCharacterDatasource(parameters: parameters);
      bool status = resp.statusCode == 200;

      if (!status) {
        isLoading.value = StatusLoading.notLoading;
        notifyListeners();
        snackBarWarning(text: '${AppTranslationString.string('message_problem_list_data_server')}. ${resp.statusCode} - ${resp.statusMessage}');
        return;
      }

      // Evita ficar enviando consulta no scroll
      if ((resp.model?.isEmpty ?? false) && listResult.value.isNotEmpty) {
        _isLoadingPagination.value = true;
         snackBarSuccess(text: 'message_list_all_items');
         notifyListeners();
         return;
      }

      if (resp.model?.isNotEmpty ?? false) {
        List<RcharacterEntitieModel>? _data = resp.model as List<RcharacterEntitieModel>;
        if (_data.isNotEmpty) listResult.value.addAll(_data);
      }
      isLoading.value = StatusLoading.notLoading;
      _pageNext.value = _pageNext.value + 1;
      notifyListeners();
    } catch (e) {
      isLoading.value = StatusLoading.notLoading;
      snackBarWarning(text: '${AppTranslationString.string('message_problem_list_data_server')} $e');
      debugPrint("Não foi possível listar os registros cadastrados da receita, $e");
      notifyListeners();
    }
  }
}

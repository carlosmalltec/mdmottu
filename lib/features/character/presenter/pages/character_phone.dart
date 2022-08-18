import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdmottu/core/scaffold_app/scaffold_app.dart';
import 'package:mdmottu/dependency_injections/service_locator.dart';
import 'package:mdmottu/lang/app_translation.dart';

import '../../../../core/enum/status_loading.dart';
import '../../../../core/responsive/responsive_builder.dart';
import '../../../../core/widgets/not_hash_data.dart';
import '../../../../core/widgets/problem_network.dart';
import '../../infra/models/character_model.dart';
import '../controller/character_controller.dart';
import '../widgets/card_item_character.dart';
import '../widgets/shimmer_character.dart';

class CharacterPhone extends StatefulWidget {
  const CharacterPhone({Key? key}) : super(key: key);

  @override
  State<CharacterPhone> createState() => _CharacterPhoneState();
}

class _CharacterPhoneState extends State<CharacterPhone> with WidgetsBindingObserver {
  final _controller = ServiceLocator().getIt.get<CharacterController>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.getFirst(isFirst: true);

      _scrollController.addListener(() {
        _controller.onScroll(_scrollController.position.pixels, _scrollController.position.maxScrollExtent);
      });
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Widget _body() {
    return ResponsiveBuilder(
      builder: (context, view) {
        return RefreshIndicator(
          onRefresh: () async => await _controller.swipeRefresh(),
          child: AnimatedBuilder(
            animation: _controller,
            builder: (_, Widget? widget) {
              if (_controller.isLoading.value == StatusLoading.notConnecting) {
                return SizedBox(
                  height: view.localWidgetSize?.height,
                  child: ProblemNetwork(onPressed: () async => await _controller.swipeRefresh()),
                );
              }

              if ((_controller.isLoading.value == StatusLoading.notLoading) || (_controller.isLoading.value == StatusLoading.nextPageLoading)) {
                if (_controller.listResult.value.isEmpty) {
                  return SizedBox(
                    height: view.localWidgetSize?.height,
                    child: NotHashData(onPressed: () async => await _controller.swipeRefresh()),
                  );
                }
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 17),
                  child: CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final RcharacterEntitieModel model = _controller.listResult.value[index];
                            return CardItemCharacter(
                              controller: _controller,
                              itemIndex: index,
                              model: model,
                            );
                          },
                          childCount: _controller.listResult.value.length,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                if (_controller.isLoading.value == StatusLoading.shimmerLoading) {
                  return const ShimmerCharacter();
                } else {
                  return const CupertinoActivityIndicator();
                }
              }
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldApp(
      onWillPop: () => Future.value(true),
      appBar: AppBar(
        title: Text(AppTranslationString.string('title_page_personal')),
        centerTitle: true,
      ),
      body: _body(),
    );
  }
}

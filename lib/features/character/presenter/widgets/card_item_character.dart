import 'package:flutter/material.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

import '../../infra/models/character_model.dart';
import '../controller/character_controller.dart';
import 'item_text.dart';

class CardItemCharacter extends StatelessWidget {
  final CharacterController controller;
  final RcharacterEntitieModel model;
  final int itemIndex;
  const CardItemCharacter({
    Key? key,
    required this.controller,
    required this.model,
    required this.itemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? image = model.image;
    String? name = model.name ?? '--';
    String? gender = model.gender ?? '--';
    String? status = model.status ?? '--';
    String? species = model.species ?? '--';
    String? data = controller.dateFormat(model.created);

    Color borderCard =gender.toLowerCase() == "male" ? ColorsApp.ff277BC0 : ColorsApp.ffB9005B;
    return Card(
      elevation: 0,
      child: ClipPath(
        clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
        child: Container(
          decoration: BoxDecoration(border: Border(left: BorderSide(color: borderCard, width: 5))),
          child: Column(
            children: [
              Visibility(
                visible: image != null,
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: controller.isExpandedIndex.value == itemIndex ? null : 200,
                ),
              ),
              ExpansionPanelList(
                elevation: 0,
                animationDuration: const Duration(milliseconds: 900),
                expandedHeaderPadding: const EdgeInsets.all(0),
                expansionCallback: (int index, bool isExpanded) => controller.expansionCallback(itemIndex, isExpanded),
                children: [
                  ExpansionPanel(
                    canTapOnHeader: true,
                    headerBuilder: (BuildContext context, bool isExpanded) {
                      return Container(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  ItemText(title: 'Nome', description: name),
                                  const SizedBox(height: 10),
                                  ItemText(title: 'Sexo', description: gender),
                                  const SizedBox(height: 10),
                                  Visibility(visible: !(controller.isExpandedIndex.value == itemIndex), child: const SizedBox(height: 10)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    isExpanded: controller.isExpandedIndex.value == itemIndex,
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(color: ColorsApp.ffEEEEEE, thickness: 1),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ItemText(title: 'Status', description: status),
                                  const SizedBox(width: 60),
                                  ItemText(title: 'Espécies', description: species),
                                ],
                              ),
                              const SizedBox(height: 10),
                              ItemText(title: 'Data de Criação', description: data),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

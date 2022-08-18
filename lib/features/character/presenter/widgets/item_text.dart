import 'package:flutter/material.dart';
import 'package:mdmottu/features/design_system/colors/colors_app.dart';

class ItemText extends StatelessWidget {
  final String title;
  final String description;
  final Color? colorDescription;
  final Color? colorTitle;

  const ItemText({Key? key, required this.title, required this.description, this.colorDescription, this.colorTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium?.copyWith(color: ColorsApp.ff222E50.withOpacity(0.5))),
        Text(description.toUpperCase(), style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
      ],
    );
  }
}

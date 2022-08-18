import 'package:flutter/material.dart';
import 'package:mdmottu/lang/app_translation.dart';

class BoxTextHelper extends StatelessWidget {
  final String text;
  final String description;
  const BoxTextHelper({Key? key, required this.text, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      text: TextSpan(
        text: AppTranslationString.string(text),
        style:  Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
        children: [
          TextSpan(
            text: AppTranslationString.string(description),
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

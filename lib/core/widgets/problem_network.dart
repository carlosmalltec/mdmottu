import 'package:flutter/material.dart';

import '../../features/design_system/colors/colors_app.dart';
import '../../lang/app_translation.dart';

class ProblemNetwork extends StatelessWidget {
  final void Function()? onPressed;
  const ProblemNetwork({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTranslationString.string('failure_network'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorsApp.ff263545),
            ),
            onPressed: onPressed,
            icon: const Icon(
              Icons.network_locked_outlined,
              color: ColorsApp.ffFFFFFF,
            ),
            label: Text(
              AppTranslationString.string('Checar o sinal'),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}

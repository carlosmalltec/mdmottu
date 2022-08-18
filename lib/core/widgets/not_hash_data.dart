import 'package:flutter/material.dart';

import '../../features/design_system/colors/colors_app.dart';
import '../../lang/app_translation.dart';



class NotHashData extends StatelessWidget {
  final void Function()? onPressed;
  const NotHashData({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppTranslationString.string('not_hash_data'),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 10),
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(ColorsApp.ff263545),
            ),
            onPressed: onPressed,
            icon: const Icon(
              Icons.data_array,
              color: ColorsApp.ffFFFFFF,
              size: 50,
            ),
            label: Text(
              AppTranslationString.string('Solicitar dados'),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}

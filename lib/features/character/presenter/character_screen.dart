import 'package:flutter/material.dart';
import '/core/responsive/orientation_layout.dart';
import '/core/responsive/screen_type_layout.dart';
import 'pages/character_phone.dart';



class CharacterScreen extends StatelessWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: (context) => const CharacterPhone(),
        landscape: (context) => const CharacterPhone(),
      ),
      tablet: const CharacterPhone(),
      desktop: const CharacterPhone(),
    );
  }
}


import 'package:authentech/common_widget/styles/spacing_styles.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/text_strings.dart';
import '../../utils/helpers/helper_functions.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed});

  final String image, title, subtitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(children: [
            /// Image
              Image(image: AssetImage(image), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBetweenItems),
              
              ///  Title et SubTitle
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(subtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),

              ///  Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: const Text(MtTexts.tContinue),
                
                ),
              ),
          ],),
          ),
      ),
    );
  }
}
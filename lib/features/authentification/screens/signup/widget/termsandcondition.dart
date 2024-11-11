
import 'package:authentech/utils/constants/colors.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/signup_controller.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value),
          )
        ),
        const SizedBox(width: TSize.spaceBetweenItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${MtTexts.tIagree}', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: MtTexts.tPrivacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
              ),
              TextSpan(text: '${MtTexts.tAnd}', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: MtTexts.tTermsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white : TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
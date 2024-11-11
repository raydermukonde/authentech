
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:authentech/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../controllers/forget_password_controller.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(TSize.defautSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(MtTexts.tForgetPassword, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: TSize.spaceBetweenItems),
            Text(MtTexts.tForgetMailSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: TSize.spaceBetweenItems * 2),
            /// Text field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  label: Text(MtTexts.tEmail),
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenItems),
            /// Submit Button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () => controller.sendPasswordResetEmail(), child: const Text(MtTexts.tSubmit)))
          ]
            
        ),),
    );
  }
}



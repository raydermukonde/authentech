import 'package:authentech/features/authentification/controllers/signup_controller.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:authentech/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'termsandcondition.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({super.key});

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  bool loading = false;
  String phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    

    return Container(
      padding: const EdgeInsets.symmetric(vertical: TSize.tFormHeight - 10),
      child: Form(
        key: controller.signupFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.validateName(value),
                    decoration: const InputDecoration(
                      label: Text(MtTexts.tFirstName),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
                const SizedBox(width: TSize.spaceBtwInputFields),
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.validateName(value),
                    decoration: const InputDecoration(
                      label: Text(MtTexts.tLastName),
                      prefixIcon: Icon(Iconsax.user),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSize.spaceBetweenItems),
            TextFormField(
              controller: controller.userName,
              validator: (value) => TValidator.validateName(value),
              decoration: const InputDecoration(
                label: Text(MtTexts.tUserName),
                prefixIcon: Icon(Iconsax.user_edit),
              ),
            ),
            const SizedBox(height: TSize.tFormHeight - 20),
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                label: Text(MtTexts.tEmail),
                prefixIcon: Icon(Icons.email_outlined),
              ),
            ),
            const SizedBox(height: TSize.tFormHeight - 20),
            IntlPhoneField(
              onChanged: (value) {
                phoneNumber = value.completeNumber;
              },
              controller: controller.phoneNo,
              validator: (value) => TValidator.validatePhoneNumber(value?.completeNumber),
              decoration: const InputDecoration(
                label: Text(MtTexts.tPhoneNo),
                prefixIcon: Icon(Icons.phone_android_outlined),
              ),
              initialCountryCode: 'CD', // Set the default country code
              showCountryFlag: true, // Allow user to select country
            ),
            const SizedBox(height: TSize.tFormHeight - 20),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  label: const Text(MtTexts.tPassword),
                  prefixIcon: const Icon(Icons.fingerprint),
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                    icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSize.spaceBetweenSections),
            TermsAndConditionsCheckbox(),
            const SizedBox(height: TSize.spaceBetweenSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.signup(),   
                    child: const Text(MtTexts.tSignup),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




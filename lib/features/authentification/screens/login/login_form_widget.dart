import 'package:Broke_a_fintech_app/src/features/authentification/screens/password_configuration/forget_password.dart';
import 'package:Broke_a_fintech_app/src/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Broke_a_fintech_app/src/utils/constants/sizes.dart';
import 'package:Broke_a_fintech_app/src/utils/constants/text_strings.dart';
import 'package:iconsax/iconsax.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';
import 'package:myapp/utils/validators/validation.dart';

import '../../controllers/login_controller.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: TSize.tFormHeight - 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: MtTexts.tEmail,
                  hintText: MtTexts.tEmail,
                  ),
            ),
            const SizedBox(
              height: TSize.tFormHeight,
            ),
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,
                decoration:  InputDecoration(
                  prefixIcon: const Icon(Iconsax.password_check),
                  labelText: MtTexts.tPassword,
                  hintText: MtTexts.tPassword,
                  
                  suffixIcon: IconButton(
                        onPressed: () => controller.hidePassword.value = !controller
                            .hidePassword.value,
                        icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),),
                ),
              ),
            ),
            const SizedBox(height: TSize.tFormHeight - 20),

            /// Remember me and forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Obx(
                  () => Row(
                    children: [
                      Checkbox(
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value = !controller
                            .rememberMe.value,
                      ),
                      Text(MtTexts.tRememberMe),
                    ],
                  ),
                ),


            /// Forget password
            TextButton(
              onPressed: () => Get.to(() =>  const ForgetPassword()),
              child: Text(MtTexts.tForgetPassword),
            ),
          ],
        ),
            const SizedBox(height: TSize.spaceBetweenSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.loginUser(),
                
                child: Text(MtTexts.tLogin.toUpperCase()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

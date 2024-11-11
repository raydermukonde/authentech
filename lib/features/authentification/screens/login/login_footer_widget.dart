
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../signup/signup_screen.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: TSize.tFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(
              image: AssetImage(MtImages.tGoogleLogoImage),
              width: 20.0,
            ),
            onPressed: () => controller.googleSignIn(),
            label: const Text(MtTexts.tSignInWithGoogle),
          ),
        ),
        const SizedBox(height: TSize.tFormHeight - 20),
        TextButton(
          onPressed: () => Get.to(() => const SignupScreen()),
          child: Text.rich(
            TextSpan(
              text: MtTexts.tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyLarge,
              children: const [
                TextSpan(
                  text: MtTexts.tSignup,
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

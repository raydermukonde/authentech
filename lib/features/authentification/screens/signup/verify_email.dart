
import 'package:authentech/features/authentification/controllers/verify_email_controller.dart';
import 'package:authentech/repository/authentiction_repository/authentication_repository.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class VerifyEmailScreen extends StatelessWidget {

  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSize.defautSpacing),
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(MtImages.tVerifyEmailImage), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBetweenItems),
              
              ///  Title et SubTitle
              Text(MtTexts.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(email ?? '', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(MtTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),

              ///  Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(MtTexts.tContinue)
                
                ),
              ),
              const SizedBox(height: TSize.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(MtTexts.rensendEmail),
                
                ),
              ),
            ],
          ),
        ),
      ),
      );
  }
}
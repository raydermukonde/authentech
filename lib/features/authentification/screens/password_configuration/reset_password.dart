
import 'package:authentech/features/authentification/controllers/forget_password_controller.dart';
import 'package:authentech/features/authentification/screens/login/login_screen.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear)
          ),
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSize.defautSpacing),
          child: Column(
            
            children:[
              /// Image
              Image(image: AssetImage(MtImages.tVerifyEmailImage), width: THelperFunctions.screenWidth() * 0.6,),
              const SizedBox(height: TSize.spaceBetweenItems),
              
              ///  Email, Title et SubTitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(MtTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),
              Text(MtTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: TSize.spaceBetweenItems),

              ///  Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(MtTexts.done),
                
                ),
              ),
              const SizedBox(height: TSize.spaceBetweenItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgetPasswordController.instance.resendPasswordEmail(email),
                  child: const Text(MtTexts.rensendEmail),
                
                ),
              ),
        
            ],
              
          ),),
      ),
    );
  }
}
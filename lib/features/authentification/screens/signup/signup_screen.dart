import 'package:authentech/common_widget/form/form_header_widget.dart';
import 'package:authentech/features/authentification/screens/signup/widget/signup_form_widget.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/login_controller.dart';
import '../login/login_screen.dart';

class SignupScreen extends StatelessWidget {
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3442526231.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:875701437.
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return  SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSize.tDefaultSize),
            child:  Column(
              children:[
                 const FormHeaderWidget(
                  image: MtImages.tWelcomeScreenImage,
                  title: MtTexts.tSignUpTitle,
                  subTitle: MtTexts.tSignUpSubTitle,
                ),
                const SignUpFormWidget(),
                Column(
                  children: [
                    const Text("OR"),
                    SizedBox(
                      width: double.infinity,
                      child:OutlinedButton.icon(
                        onPressed: ()=> controller.googleSignIn(),
                       icon: const Image(image: AssetImage(MtImages.tGoogleLogoImage), width: 20.0,),
                       label: Text(MtTexts.tSignInWithGoogle.toUpperCase()),
                       ),
                    ),
                    TextButton(
                      onPressed: () => Get.to(()=> const LoginScreen()),
                      child: Text.rich(
                        TextSpan(
                          children:[
                            TextSpan(text: MtTexts.tAlreadyHaveAnAccount,style: Theme.of(context).textTheme.bodyLarge),
                            TextSpan(text:MtTexts.tLogin.toUpperCase())
                          ] 
                          )
                          ),
                          ),
                  ],
                )
               
              ],
      
          ),
        ),
      ),
      ),
    
    );
  }
}



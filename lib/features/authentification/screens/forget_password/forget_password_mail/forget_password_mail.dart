import 'package:authentech/common_widget/form/form_header_widget.dart';
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';



class ForgetPasswordMailScreen extends StatefulWidget {
  const ForgetPasswordMailScreen({super.key});

  @override
  State<ForgetPasswordMailScreen> createState() => _ForgetPasswordMailScreenState();
}

class _ForgetPasswordMailScreenState extends State<ForgetPasswordMailScreen> {
  get verificationId => null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // Suggested code may be subject to a license. Learn more: ~LicenseLog:419376752.
            padding: const EdgeInsets.all(TSize.tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: TSize.tDefaultSize * 4),
                const FormHeaderWidget(
                  image: MtImages.tForgetPasswordImage,
                  title: MtTexts.tForgetPassword,
                  subTitle: MtTexts.tForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heigthBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: TSize.tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: MtTexts.tEmail,
                          hintText: MtTexts.tEmail,
                          prefixIcon: Icon(Icons.mail_outline_rounded),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                           // Get.to(() => OtpScreen(verificationId: verificationId,));
                          },
                          child: const Text(MtTexts.tNext),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: TSize.tFormHeight,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

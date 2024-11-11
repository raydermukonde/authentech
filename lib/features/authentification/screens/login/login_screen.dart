import 'package:flutter/material.dart';
import 'package:myapp/common_widget/form/form_header_widget.dart';
import 'package:myapp/features/authentification/screens/login/login_footer_widget.dart';
import 'package:myapp/utils/constants/image_strings.dart';
import 'package:myapp/utils/constants/sizes.dart';
import 'package:myapp/utils/constants/text_strings.dart';



import 'login_form_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(TSize.tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                  image: MtImages.tWelcomeScreenImage, 
                  title: MtTexts.tLoginTitle, 
                  subTitle: MtTexts.tLoginSubTitle,),
                 LoginForm(),
                 LoginFooterWidget(),
          
          ],
        ),
      ),
    ),
  )
    );
      
    
  }
}

                 
                         
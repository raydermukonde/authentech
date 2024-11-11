
import 'package:flutter/material.dart';
import 'package:Broke_a_fintech_app/src/utils/constants/image_strings.dart';
import 'package:Broke_a_fintech_app/src/utils/constants/text_strings.dart';
import 'package:myapp/utils/constants/image_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: const AssetImage(MtImages.tWelcomeScreenImage), height: size.height * 0.2,),
        Text(TTexts.tLoginTitle,
        style: Theme.of(context).textTheme.displayLarge),
    Text(TTexts.tLoginSubTitle,
        style: Theme.of(context).textTheme.bodyLarge),
      ],
    
    );
  }
}

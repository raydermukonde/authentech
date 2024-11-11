
import 'package:authentech/utils/constants/image_strings.dart';
import 'package:authentech/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';


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
        Text(MtTexts.tLoginTitle,
        style: Theme.of(context).textTheme.displayLarge),
    Text(MtTexts.tLoginSubTitle,
        style: Theme.of(context).textTheme.bodyLarge),
      ],
    
    );
  }
}

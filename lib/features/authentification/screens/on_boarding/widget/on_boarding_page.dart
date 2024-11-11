
import 'package:flutter/material.dart';
import 'package:myapp/utils/helpers/helper_functions.dart';

import '../../../../../utils/constants/sizes.dart';

class OnBordingPages extends StatelessWidget {
  const OnBordingPages({
    super.key, required this.image, required this.title, required this.subTitle,
  });
 final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSize.defautSpacing),
      child: Column(
        children: [
          Image( 
          width: THelperFunctions.screenWidth() * 0.8,
          height: THelperFunctions.screenHeight() * 0.6,
          image: AssetImage(image),
          ),
          Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSize.spaceBetweenItems,),
          Text(subTitle, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
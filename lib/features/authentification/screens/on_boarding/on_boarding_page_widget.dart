

import 'package:authentech/features/authentification/models/model_on_boarding.dart';
import 'package:authentech/utils/constants/sizes.dart';
import 'package:authentech/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class OnBordingPageWidget extends StatelessWidget {
  const OnBordingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(TSize.tDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: THelperFunctions.screenHeight() * 0.8,
            width: THelperFunctions.screenWidth() * 0.6,
          ),
          Column(
            children: [
              Text(
                model.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            model.counterText,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 80.0,
          )
        ],
      ),
    );
  }
}

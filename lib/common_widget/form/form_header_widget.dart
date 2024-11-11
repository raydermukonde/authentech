import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    this.imageColor,
    this.heigthBetween,

    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.textAlign,
    super.key,
  });
  final String image,title,subTitle;
  final Color? imageColor;
  final double? heigthBetween;
  final double imageHeight;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(
          image:  AssetImage(image),
          color: imageColor,
          height: size.height * imageHeight,
          
        ),
        Text(title, style: Theme.of(context).textTheme.displayLarge),
        Text(subTitle, textAlign: textAlign, style: Theme.of(context).textTheme.bodyLarge),

      ],
    );
  }
}

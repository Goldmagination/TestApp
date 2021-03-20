import 'package:flutter/material.dart';

class OpaqueBackgroundImage extends StatelessWidget {
  final imageUrl;

  const OpaqueBackgroundImage({Key key, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          imageUrl,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit
              .fill, //our image is defined here. Boxfit.fill allows us to stretch the image without empty pieces in the container
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                //defined a gradient that covers our image
                colors: [
                  const Color.fromRGBO(35, 152, 94, 0.8),
                  const Color.fromRGBO(35, 152, 94, 0.8),
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
      ],
    );
  }
}

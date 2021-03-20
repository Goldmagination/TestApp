import 'package:aufgabe/widgets/auth_form.dart';

import 'package:flutter/material.dart';

class PlaceContainer extends StatefulWidget {
  @override
  _PlaceContainerState createState() => _PlaceContainerState();
}

class _PlaceContainerState extends State<PlaceContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            //allows you not to merge with the lower part of the screen
            BoxShadow(
                blurRadius: 20,
                offset: Offset.zero,
                color: Colors.grey.withOpacity(0.5))
          ],
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                children: [
                  Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage(
                            'assets/images/logo.png'), //it is also downloaded from your website:) Hopefully, looks similar
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    // here i was try to make an different style for different parts of the same sentence
                    text: TextSpan(
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey[700],
                        ),
                        children: const [
                          TextSpan(
                            text: 'easy',
                          ),
                          TextSpan(
                            text: 'Verein',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: '®', style: TextStyle(fontSize: 18))
                        ]),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            width: double.infinity,
            child:
                AuthForm(), //here is a widget with our auth form and validation
          ),
        ],
      ),
    );
  }
}

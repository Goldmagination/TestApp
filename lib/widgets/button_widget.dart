import 'package:flutter/material.dart';

//Custom Button widget for both login and registration button
class ButtonWidget extends StatelessWidget {
  final String title;
  final bool hasBorder;
  final IconData icon;
  final Function validation;

  ButtonWidget({
    this.icon,
    this.title,
    this.hasBorder,
    this.validation,
  });

  @override
  Widget build(BuildContext context) {
    //it changes its value depending on the entered parameters. Either it's login or registration
    //for comfort i used 'hasBorder' property, which means 'registration' if it's true.
    final text = Text(
      title,
      style: TextStyle(
        color: hasBorder ? Colors.black : Colors.white,
        fontWeight: hasBorder ? FontWeight.normal : FontWeight.w600,
        fontSize: 16.0,
      ),
    );
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          color: hasBorder ? Colors.white : Color.fromRGBO(35, 152, 93, 1),
          borderRadius: BorderRadius.circular(10),
          border: hasBorder
              ? Border.all(
                  color: Colors.black,
                  width: 1.0,
                )
              : Border.fromBorderSide(BorderSide.none),
        ),
        child: InkWell(
          onTap: hasBorder ? () {} : validation,
          borderRadius: BorderRadius.circular(10),
          child: Container(
              height: 40.0,
              child: icon == null
                  ? Center(child: text)
                  : Row(
                      //also here i added an icon if button is login
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text,
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.login,
                        ),
                      ],
                    )),
        ),
      ),
    );
  }
}

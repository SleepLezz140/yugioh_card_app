import 'package:flutter/material.dart';
import 'package:yugioh_card_app/card_screen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    const bool _hasInternet = true;

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final ThemeData _theme = Theme.of(context);

    void seeCards() {
      if (_hasInternet) {
      Navigator.of(context).push(MaterialPageRoute( builder: (context) => App()));
      } 
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: mediaQuery.size.height * 0.25),
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.fitHeight,
            width: mediaQuery.size.width * 0.4,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.yellow[700]),
              ),
              onPressed: seeCards,
              child: Text(
                'See Cards',
                 style: _theme.textTheme.button?.copyWith(color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

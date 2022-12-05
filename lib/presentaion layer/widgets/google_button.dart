import 'package:flutter/material.dart';
import 'package:sinric_app/shared/applocal.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: InkWell(
        onTap: () {
          ///
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/images/google.png',
                  width: 40,
                )),
            const SizedBox(width: 8),
            Text(
              getLang(context, "Sign_in_with_google"),
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

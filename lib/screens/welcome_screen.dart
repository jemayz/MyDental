import 'package:flutter/material.dart';
import 'package:mymedic/screens/home_screen.dart';
import 'package:mymedic/screens/login_screen.dart';
import 'package:mymedic/screens/sign_up_screen.dart';
import 'package:mymedic/widgets/navbar_roots.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color:Color(0xFFE8ECDE),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavBarRoots(),
                      ));
                },
                child: Text(
                  "SKIP",
                  style: TextStyle(
                    color: Color(0xFF266975),
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),// SizedBox ni macam bagi space
            Padding(
              padding: EdgeInsets.all(20),
              child: Image.asset("assets/doctor/doctors.png"),
            ),
            SizedBox(height: 50),
            Text(
              "Welcome to MyDental",
              style: TextStyle(
                color: Color(0xFF266975),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0,
                wordSpacing: 1,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Book your dentist now!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Color(0xFF266975),
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => loginScreen(),
                          ));
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 130,
                      child: Text(
                        "Log In",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Material(
                  color: Color(0xFF266975),
                  borderRadius: BorderRadius.circular(15),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                    },
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      width: 130,
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

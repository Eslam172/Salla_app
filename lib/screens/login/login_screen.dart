import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salla_app/screens/register/register_screen.dart';
import 'package:salla_app/shared/components/components.dart';
import 'package:salla_app/shared/styles/colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/welcome.png'),
                width: MediaQuery.of(context).size.width*.2,
                height: MediaQuery.of(context).size.height*.1,
                color: Colors.grey[200],
              ),
              SizedBox(height: 15,),
              Text(
                'Welcome back !',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: GoogleFonts.aclonica().fontFamily),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Login to your account',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[300],
                    fontFamily: GoogleFonts.alata().fontFamily),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.white,
                              spreadRadius: .1)
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: secondColor,
                        child: Image(
                          image: AssetImage(
                            'assets/images/gmail.png',
                          ),
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: GoogleFonts.alata().fontFamily),
                        decoration: InputDecoration(
                          label: Text(
                            'Email',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: GoogleFonts.alata().fontFamily),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 2),
                              gapPadding: 5),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 1),
                              gapPadding: 5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              color: Colors.white,
                              spreadRadius: .1)
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 30,
                        backgroundColor: secondColor,
                        child: Image(
                          image: AssetImage(
                            'assets/images/lock.png',
                          ),
                          width: 25,
                          height: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: GoogleFonts.alata().fontFamily),
                        decoration: InputDecoration(
                          label: Text(
                            'Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: GoogleFonts.alata().fontFamily),
                          ),
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 2),
                              gapPadding: 5),
                          enabledBorder: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                              BorderSide(color: Colors.white, width: 1),
                              gapPadding: 5),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              side: const BorderSide(
                                  color: secondColor, width: 1)))),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: secondColor,
                        fontSize: 20,
                        fontFamily: GoogleFonts.aclonica().fontFamily),
                  )),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: 1,
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Text(
                      'Or login with',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: 1,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .22,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Image(
                          image: AssetImage('assets/images/google.png'),
                          color: Colors.red,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .22,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child:  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Image(
                          image: const AssetImage('assets/images/facebook.png'),
                          color: Colors.blueAccent.shade700,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * .22,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                        child: Image(
                          image: AssetImage('assets/images/twitter.png'),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?',style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontFamily: GoogleFonts.alata().fontFamily
                  ),),
                  TextButton(
                      onPressed: (){
                        navigateAndFinish(context, RegisterScreen());
                      },
                      child: Text('Register',style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: GoogleFonts.alata().fontFamily
                      ),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
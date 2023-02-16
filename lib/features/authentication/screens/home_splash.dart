import 'package:auth_app/features/authentication/screens/signup.dart';

import './signin.dart';
import 'package:flutter/material.dart';

class HomeSplash extends StatelessWidget {
  const HomeSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: EdgeInsets.only(top: 63),
                  padding: EdgeInsets.all(42),
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/1.png')),
              const Icon(
                Icons.more_horiz_outlined,
                size: 43,
              ),
              Container(
                padding: EdgeInsets.only(left: 36, right: 36),
                child: const Text(
                  'Save Money',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 36),
                child: const Text(
                  'To Save Future',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 40),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: const Text(
                  'Start securing your future by saving a portion of your income today and investing in your tomorrow, making small sacrifices now for big dreams later',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              InkWell(
                splashColor: null,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignUp(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(22),
                  padding: EdgeInsets.all(22),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 81, 16, 235),
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  child: const Text(
                    'Get Started',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

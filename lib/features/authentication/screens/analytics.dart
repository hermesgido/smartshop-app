import 'package:auth_app/features/authentication/screens/analytics_screen.dart';
import 'package:flutter/material.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 22),
              child: const Text(
                'Sales Analytics',
                style: TextStyle(
                  color: Color.fromRGBO(68, 207, 152, 1.0),
                ),
              ),
            ),
            Container(
              height: 400,
              child: Flexible(
                fit: FlexFit.tight,
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 400,
                        child: Container(
                          height: 400,
                          child: LineChart1(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 400,
                        child: Container(
                          height: 400,
                          child: LineChart1(),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

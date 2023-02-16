import 'package:auth_app/features/authentication/controllers/user_provider.dart';
import 'package:auth_app/features/authentication/screens/app_bar.dart';
import 'package:auth_app/features/authentication/screens/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../common_widgets/bottom_menu.dart';
import '../../../common_widgets/my_table.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Future myuser() async {
      final userEmail =
          await Provider.of<AuthProvider>(context, listen: false).currentUser();
      print(userEmail['email']);

      return userEmail;
    }

    final dsize = MediaQuery.of(context).size;
    return Container(
      child: Scaffold(
        drawer: NavigationDrawer1(),
        appBar: MyAppBar(title: 'hello'),
        bottomNavigationBar: BottomMenu(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 20),
                      child: const Text(
                        'Sales Overview',
                        textAlign: TextAlign.start,
                        style: TextStyle(),
                      ),
                    ),
                    Center(
                      child: FutureBuilder<dynamic>(
                        future:
                            Provider.of<AuthProvider>(context, listen: false)
                                .currentUser(),
                        builder: (BuildContext context, snapshot) {
                          if (snapshot.hasData) {
                            return Text('User email: ${snapshot.data}');
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            return Container(
                              alignment: Alignment.center,
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(221, 26, 26, 26),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  margin: EdgeInsets.all(14),
                  padding: EdgeInsets.all(14),
                  height: 90,
                  width: double.infinity,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(221, 26, 26, 26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 90,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: const [
                              Text(
                                'Stock',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromRGBO(68, 207, 152, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('670,000Tsh'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(221, 26, 26, 26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 90,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: const [
                              Text(
                                'Debts',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromRGBO(68, 207, 152, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('170,000Tsh'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(221, 26, 26, 26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 90,
                        width: 180,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: const [
                              Text(
                                'Today Sale',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromRGBO(68, 207, 152, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('377,000Tsh'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(221, 26, 26, 26),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        height: 90,
                        width: 180,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: const [
                              Text(
                                'This Month',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Color.fromRGBO(68, 207, 152, 1.0),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('4370,000Tsh'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Recent',
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        'More',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(221, 147, 145, 145)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(22),
                  child: MyTable(),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 22),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color.fromARGB(221, 28, 28, 33),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        'assets/images/wasap2.svg',
                        height: 50,
                        width: 50,
                      ),
                      Container(
                        child: Column(
                          children: const [
                            Text('Get Instant Support'),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Watch Video Tutorial')
                          ],
                        ),
                      ),
                      Icon(
                        Icons.play_circle_fill_outlined,
                        size: 42,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

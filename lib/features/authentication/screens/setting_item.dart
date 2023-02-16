import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  SettingItem({
    super.key,
    required this.title,
    required this.icon,
    required this.icon2,
  });

  final String title;
  final IconData icon;
  final IconData icon2;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(221, 26, 26, 26),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Container(
                  child: Row(
                    children: [
                      Icon(
                        icon,
                        size: 32,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(134, 255, 254, 254)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            icon2,
            size: 25,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
class todocard extends StatelessWidget {
  const todocard({super.key});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
                widthFactor: 0.85,
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  padding: EdgeInsets.all(22),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 138, 136, 132),
                      borderRadius: BorderRadius.circular(99)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          
                          "call my employees and pay them and give them a bonus",
                          style: TextStyle(
                            fontSize: 23, color: Colors.white),
                        ),
                        Container(
                          padding:EdgeInsets.only(left: 44),
                          child: Icon(Icons.close ,
                          color: Colors.red,),
                        )
                      ],
                    ),
                  ),
                ),
              );
  }
}
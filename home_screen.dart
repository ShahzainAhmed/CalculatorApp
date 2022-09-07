import 'package:flutter/material.dart';
import 'package:practiceflutter/components/my_button.dart';
import 'package:math_expressions/math_expressions.dart';
// ignore: unused_import
import 'package:practiceflutter/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1C1C1C),

      // appBar: AppBar(
      //   title: const Text("Calculator Application"),
      // ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 100),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            userInput.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            answer.toString(),
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          MyButton(
                              title: "AC",
                              onPress: () {
                                userInput = '';
                                answer = '';
                                setState(() {});
                              }),
                          MyButton(
                              title: "+/-",
                              onPress: () {
                                userInput += '+/-';
                                setState(() {});
                              }),
                          MyButton(
                              title: "%",
                              onPress: () {
                                userInput += '%';
                                setState(() {});
                              }),
                          MyButton(
                            title: "/",
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += '/';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: "7",
                              color: calcColor,
                              onPress: () {
                                userInput += '7';
                                setState(() {});
                              }),
                          MyButton(
                              title: "8",
                              color: calcColor,
                              onPress: () {
                                userInput += '8';
                                setState(() {});
                              }),
                          MyButton(
                              title: "9",
                              color: calcColor,
                              onPress: () {
                                userInput += '9';
                                setState(() {});
                              }),
                          MyButton(
                            title: "x",
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += 'x';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: "4",
                              color: calcColor,
                              onPress: () {
                                userInput += '4';
                                setState(() {});
                              }),
                          MyButton(
                              title: "5",
                              color: calcColor,
                              onPress: () {
                                userInput += '5';
                                setState(() {});
                              }),
                          MyButton(
                              title: "6",
                              color: calcColor,
                              onPress: () {
                                userInput += '6';
                                setState(() {});
                              }),
                          MyButton(
                            title: "-",
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += '-';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: "1",
                              color: calcColor,
                              onPress: () {
                                userInput += '1';
                                setState(() {});
                              }),
                          MyButton(
                              title: "2",
                              color: calcColor,
                              onPress: () {
                                userInput += '2';
                                setState(() {});
                              }),
                          MyButton(
                              title: "3",
                              color: calcColor,
                              onPress: () {
                                userInput += '3';
                                setState(() {});
                              }),
                          MyButton(
                            title: "+",
                            color: const Color(0xffffa00a),
                            onPress: () {
                              userInput += '+';
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          MyButton(
                              title: "0",
                              color: calcColor,
                              onPress: () {
                                userInput += '0';
                                setState(() {});
                              }),
                          MyButton(
                              title: ".",
                              color: calcColor,
                              onPress: () {
                                userInput += '.';
                                setState(() {});
                              }),
                          MyButton(
                              title: "DEL",
                              color: calcColor,
                              onPress: () {
                                userInput = userInput.substring(
                                    0, userInput.length - 1);
                                setState(() {});
                              }),
                          MyButton(
                            title: "=",
                            color: const Color(0xffffa00a),
                            onPress: () {
                              equalPress();
                              setState(() {});
                            },
                          ),
                        ],
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

  void equalPress() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}

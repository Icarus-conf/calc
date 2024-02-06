import 'package:calc/components/button.dart';
import 'package:calc/components/text_format.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String displayResult = '';
  String lhs = '';
  String rhs = '';
  String op = '';

  btnClick(label) {
    if (op == '=') {
      displayResult = '';
      op = '';
      lhs = '';
    }
    displayResult += label;

    setState(() {});
  }

  String calc(String lhs, String rhs, String op) {
    double LHS = double.parse(lhs);
    double RHS = double.parse(rhs);

    if (op == '+') {
      double result = LHS + RHS;
      return result.toString();
    } else if (op == '-') {
      double result = LHS - RHS;
      return result.toString();
    } else if (op == '*') {
      double result = LHS * RHS;
      return result.toString();
    } else if (op == '/') {
      double result = LHS / RHS;
      return result.toString();
    }
    return '';
  }

  equalClicked(equalOp) {
    displayResult = calc(lhs, displayResult, op);
    op = equalOp;
    setState(() {});
  }

  opreatorClicked(operation) {
    if (op.isEmpty) {
      lhs = displayResult;
    } else {
      lhs = calc(lhs, displayResult, op);
    }
    op = operation;
    displayResult = '';
    setState(() {});
  }

  void clearBtn(label) {
    displayResult = '';
    op = '';
    lhs = '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText(
          text: 'Calc',
          fontS: 25,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF89c2d9),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(25),
              child: Text(
                displayResult,
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
                childAspectRatio: 4 / 5,
              ),
              children: [
                KButton(
                  label: '7',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '8',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '9',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '/',
                  onPressed: opreatorClicked,
                ),
                KButton(
                  label: '4',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '5',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '6',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '*',
                  onPressed: opreatorClicked,
                ),
                KButton(
                  label: '1',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '2',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '3',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '-',
                  onPressed: opreatorClicked,
                ),
                KButton(
                  label: '0',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '.',
                  onPressed: btnClick,
                ),
                KButton(
                  label: '+',
                  onPressed: opreatorClicked,
                ),
                KButton(
                  label: '=',
                  onPressed: equalClicked,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: KButton(
                label: 'Clear',
                onPressed: clearBtn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

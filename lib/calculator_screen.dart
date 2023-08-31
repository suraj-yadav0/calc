

import 'package:calc/colors.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  double firstnum = 0.0;
  double secondnum = 0.0;

  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 34.0;

  onButtonClick(value) {
   if(value == "AC") {
    input = '';
    output = '';
   }else if(value == "<") {
if(input.isNotEmpty){
  input = input.substring(0,input.length -1);
}
   }else if (value == "=" ) {
   if(input.isNotEmpty){
     var userInput = input;
    userInput = input.replaceAll("x", "*");
    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel cm = ContextModel();
    var finalValue = expression.evaluate(EvaluationType.REAL, cm);
    output = finalValue.toString();
    if(output.endsWith(".0")) {
output = output.substring(0,output.length-2);
    }
    input = output;
    hideInput = true;
    outputSize = 60;
    
   }
   }else {
    input = input + value;
    hideInput = false;
    outputSize = 34;
   }
   setState(() {
     
   });
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: orangeColor,
      title: const Center(child:  Text("Calcultor",style: TextStyle(color: Colors.white,fontSize: 25,),)),),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                     hideInput ? "" : input,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      output,
                      style: TextStyle(
                        fontSize: outputSize,
                        color: Colors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ]),
            ),
          ),
          Row(
            children: [
              button(text: "AC", buttonBGcolor: orangeColor),
              button(
                text: "<",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
            button(
                text: "%",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
              button(
                text: "/",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "7"),
              button(text: "8"),
              button(
                text: "9",
              ),
              button(
                text: "x",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "4"),
              button(text: "5"),
              button(
                text: "6",
              ),
              button(
                text: "-",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
              button(text: "1"),
              button(text: "2"),
              button(
                text: "3",
              ),
              button(
                text: "+",
                buttonBGcolor: operateColor,
                tcolor: orangeColor,
              ),
            ],
          ),
          Row(
            children: [
            
              button(text: "."),
              button(
                text: "0",
              ),
              button(
                text: "=",
                buttonBGcolor: orangeColor,
              ),
            ],
          ),
          const SizedBox(height: 20,),
        ],
      ),
    );
  }


Widget button({text, tcolor = Colors.white, buttonBGcolor = buttonColor}) {
  return Expanded(
    child: Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(22),
          backgroundColor: buttonBGcolor,
        ),
        onPressed: () => onButtonClick(text),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            color: tcolor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
}

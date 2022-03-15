import 'package:flutter/material.dart';


void main(){
  runApp(Calculator());
}

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  double firstNumber = 0;
  double secondNumber = 0;
  String result = "0";
  bool dataIsEntered = false;
  static List<String> historyList = [];
  static int iteration = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Calculator'),
        ),
        body: Column(
            children: <Widget>[
              Container(
                  margin: new EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'First number'),
                    keyboardType: TextInputType.number,
                    onChanged: (String firstNumber) {
                      if (firstNumber.isNotEmpty) {
                        this.firstNumber = double.parse(firstNumber.replaceAll(",", '.'));
                        if (this.firstNumber != null && this.secondNumber != null) {
                          setState(() {
                            dataIsEntered = true;
                          });
                        }
                      }
                    },
                  )
              ),

              Container(
                  margin: new EdgeInsets.fromLTRB(10, 30, 10, 30),
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Second number'),
                    keyboardType: TextInputType.number,
                    onChanged: (String power) {
                      if (power.isNotEmpty) {
                        this.secondNumber = double.parse(power.replaceAll(",", '.'));
                        if (this.firstNumber != null && this.secondNumber != null) {
                          setState(() {
                            dataIsEntered = true;
                          });
                        }
                      }
                    },
                  )
              ),

              Container(
                margin: new EdgeInsets.fromLTRB(0, 30, 10, 30),
                child: Text(
                  "Result: $result",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),


              Expanded(
                child: Divider(),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Table(
                      children: [
                        TableRow(
                            children: [
                              ElevatedButton(
                                child: Text(" + ", style: TextStyle(fontSize: 25),),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(35.0),
                                  primary: Colors.blue.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                ),
                                onPressed: dataIsEntered
                                    ? () {
                                  setState(() {
                                    result = calculatePlus(firstNumber, secondNumber).toString();
                                    historyList.add(firstNumber.toString() +
                                        ' + ' +
                                        secondNumber.toString() +
                                        ' = ' +
                                        result);
                                  });
                                }
                                    : null,
                              ),

                              ElevatedButton(
                                child: Text(" - ", style: TextStyle(fontSize: 25),),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(35.0),
                                  primary: Colors.blue.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                ),
                                onPressed: dataIsEntered
                                    ? () {
                                  setState(() {
                                    result = calculateMinus(firstNumber, secondNumber).toString();
                                    historyList.add(firstNumber.toString() +
                                        ' - ' +
                                        secondNumber.toString() +
                                        ' = ' +
                                        result);
                                  });
                                }
                                    : null,
                              ),

                              ElevatedButton(
                                child: Text(" * ", style: TextStyle(fontSize: 25),),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(35.0),
                                  primary: Colors.blue.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                ),
                                onPressed: dataIsEntered
                                    ? () {
                                  setState(() {
                                    result = calculateMultiply(firstNumber, secondNumber).toString();
                                    historyList.add(firstNumber.toString() +
                                        ' * ' +
                                        secondNumber.toString() +
                                        ' = ' +
                                        result);
                                  });
                                }
                                    : null,
                              ),

                              ElevatedButton(
                                child: Text(" / ", style: TextStyle(fontSize: 25),),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.all(35.0),
                                  primary: Colors.blue.shade200,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                      side: BorderSide(
                                          color: Colors.grey,
                                          width: 0.5,
                                          style: BorderStyle.solid
                                      )
                                  ),
                                ),
                                onPressed: dataIsEntered
                                    ? () {
                                  setState(() {
                                    if (secondNumber != 0)
                                      result = calculateDivide(firstNumber, secondNumber).toString();
                                    historyList.add(firstNumber.toString() +
                                        ' / ' +
                                        secondNumber.toString() +
                                        ' = ' +
                                        result);
                                  });
                                }
                                    : null,
                              ),
                            ]
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ]
        )
    );
  }

  double calculatePlus(double firstNumber, double secondNumber) => (firstNumber + secondNumber);

  double calculateMinus(double firstNumber, double secondNumber) => (firstNumber - secondNumber);

  double calculateMultiply(double firstNumber, double secondNumber) => (firstNumber * secondNumber);

  double calculateDivide(double firstNumber, double secondNumber) => (firstNumber / secondNumber);

}
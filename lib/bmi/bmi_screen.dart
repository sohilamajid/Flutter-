import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  @override
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  double weight = 0;
  double height = 0;
  double bmiResult = 0;

  void calculateBMI() {
    setState(() {
      bmiResult = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BMI Calculator',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Your Weight in Kg',
              ),
              onChanged: (value) {
                setState(() {
                  weight = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Your Height in Cm',
              ),
              onChanged: (value) {
                setState(() {
                  height = double.tryParse(value) ?? 0;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateBMI,
              child: Text('CALCULATE',style: TextStyle(fontSize: 30),),
            ),
            SizedBox(height: 20),
            Text(
              'YOUR RESULT : $bmiResult',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),
            ),
          ],
        ),
      ),
    );
  }
}

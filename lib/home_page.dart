import 'dart:math';

import 'package:berid_provider/height_provider.dart';
import 'package:berid_provider/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Your Weight (kg) :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Consumer<WeightProvider>(
              builder: ((context, weightProvider, _) => Slider(
                    min: 1,
                    max: 100,
                    divisions: 100,
                    value: weightProvider.weight,
                    label: weightProvider.weight.round().toString(),
                    onChanged: ((newValue) {
                      print('weight : $newValue');
                      weightProvider.weight = newValue;
                    }),
                  )),
            ),
            const Text(
              "Your Height (cm) :",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Consumer<HeightProvider>(
              builder: ((context, heightProvider, _) => Slider(
                    min: 1,
                    max: 200,
                    divisions: 200,
                    label: heightProvider.height.round().toString(),
                    value: heightProvider.height,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.pink.withOpacity(0.2),
                    onChanged: ((newValue) {
                      print('Heigth : $newValue');
                      heightProvider.height = newValue;
                    }),
                  )),
            ),
            const SizedBox(
              height: 50,
            ),
            Consumer<WeightProvider>(
              builder: (context, weightProvider, _) => Consumer<HeightProvider>(
                builder: (context, heightProvider, _) => Text(
                  "Your BMI : \n${(weightProvider.weight / (pow(heightProvider.height / 100, 2))).toStringAsFixed(2)}",
                  style:const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/calculator_controller.dart';

class CalculatorScreen extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Display Section
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        controller.expression.value,
                        style: TextStyle(fontSize: 24, color: Colors.black),
                        textAlign: TextAlign.right,
                      )),
                  SizedBox(height: 10),
                  Obx(() => Text(
                        controller.result.value,
                        style: TextStyle(fontSize: 48, color: Colors.greenAccent, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      )),
                ],
              ),
            ),
          ),
          // Buttons Section
          Expanded(
            flex: 10,
            child: GridView.count(
              crossAxisCount: 4,
              padding: EdgeInsets.all(8),
              children: [
                _buildButton('C', onTap: controller.clear, color: Colors.redAccent),
                _buildButton('⌫', onTap: controller.delete),
                _buildButton('(', onTap: () => controller.append('(')),
                _buildButton(')', onTap: () => controller.append(')')),
                _buildButton('7', onTap: () => controller.append('7')),
                _buildButton('8', onTap: () => controller.append('8')),
                _buildButton('9', onTap: () => controller.append('9')),
                _buildButton('÷', onTap: () => controller.append('÷'), color: Colors.blueAccent),
                _buildButton('4', onTap: () => controller.append('4')),
                _buildButton('5', onTap: () => controller.append('5')),
                _buildButton('6', onTap: () => controller.append('6')),
                _buildButton('×', onTap: () => controller.append('×'), color: Colors.blueAccent),
                _buildButton('1', onTap: () => controller.append('1')),
                _buildButton('2', onTap: () => controller.append('2')),
                _buildButton('3', onTap: () => controller.append('3')),
                _buildButton('-', onTap: () => controller.append('-'), color: Colors.blueAccent),
                _buildButton('0', onTap: () => controller.append('0')),
                _buildButton('.', onTap: () => controller.append('.')),
                _buildButton('=', onTap: controller.calculate, color: Colors.green),
                _buildButton('+', onTap: () => controller.append('+'), color: Colors.blueAccent),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String label, {required VoidCallback onTap, Color color = Colors.grey}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

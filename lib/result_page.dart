import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double bmi;
  final String status;

  const ResultPage({super.key, required this.bmi, required this.status});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 360,
          height: 800,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: const Color(0xFF1C2135),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFF24263B),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                ),
              ),
              const Positioned(
                left: 111,
                top: 13,
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: 148,
                child: Container(
                  width: 319,
                  height: 503,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF333244),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 147,
                top: 206,
                child: Text(
                  status,
                  style: TextStyle(
                    color: status == 'Normal' ? Color(0xFF21BF73) : Colors.red,
                    fontSize: 20,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 116,
                top: 263,
                child: Text(
                  bmi.toStringAsFixed(1),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 64,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 75,
                child: Text(
                  'Your Result',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 700,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 360,
                    height: 100,
                    decoration: BoxDecoration(color: Color(0xFFE83D67)),
                    child: const Center(
                      child: Text(
                        'Re - Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 57,
                top: 400,
                child: Text(
                  'You Have a $status Body Weight,\n${status == 'Normal' ? 'Good Job.' : 'Please take care of your health.'}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF8B8C9E),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
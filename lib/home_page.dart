import 'package:flutter/material.dart';
import 'result_page.dart'; // Import halaman result

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedGender = 'Male';
  double height = 150;
  int weight = 60;
  int age = 26;

  void updateWeight(int newWeight) {
    setState(() {
      weight = newWeight;
    });
  }

  void updateAge(int newAge) {
    setState(() {
      age = newAge;
    });
  }

  void calculateBMI(BuildContext context) {
    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);
    String status;

    if (bmi < 18.5) {
      status = 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      status = 'Normal';
    } else if (bmi >= 25 && bmi <= 29.9) {
      status = 'Overweight';
    } else {
      status = 'Obese';
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(bmi: bmi, status: status),
      ),
    );
  }

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
                left: 21,
                top: 70,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Male';
                    });
                  },
                  child: Container(
                    width: 155,
                    height: 180,
                    decoration: ShapeDecoration(
                      color: selectedGender == 'Male' ? Color(0xFFE83D67) : Color(0xFF24263B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.male, size: 64, color: Colors.white),
                        Text(
                          'Male',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 185,
                top: 70,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = 'Female';
                    });
                  },
                  child: Container(
                    width: 155,
                    height: 180,
                    decoration: ShapeDecoration(
                      color: selectedGender == 'Female' ? Color(0xFFE83D67) : Color(0xFF333244),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.female, size: 64, color: Colors.white),
                        Text(
                          'Female',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 275,
                child: Container(
                  width: 319,
                  height: 189,
                  decoration: ShapeDecoration(
                    color: Color(0xFF333244),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: TextStyle(
                          color: Color(0xFF8B8C9E),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Slider(
                        value: height,
                        min: 100,
                        max: 250,
                        onChanged: (newHeight) {
                          setState(() {
                            height = newHeight;
                          });
                        },
                        activeColor: Color(0xFFE83D67),
                        inactiveColor: Color(0xFF8B8C9E),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: height.toStringAsFixed(0),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: 'cm',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 21,
                top: 493,
                child: Container(
                  width: 155,
                  height: 180,
                  decoration: ShapeDecoration(
                    color: Color(0xFF24263B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: TextStyle(
                          color: Color(0xFF8B8C9E),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              updateWeight(weight - 1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              updateWeight(weight + 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 185,
                top: 493,
                child: Container(
                  width: 155,
                  height: 180,
                  decoration: ShapeDecoration(
                    color: Color(0xFF333244),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: TextStyle(
                          color: Color(0xFF8B8C9E),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, color: Colors.white),
                            onPressed: () {
                              updateAge(age - 1);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              updateAge(age + 1);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 700,
                child: GestureDetector(
                  onTap: () => calculateBMI(context),
                  child: Container(
                    width: 360,
                    height: 100,
                    decoration: BoxDecoration(color: Color(0xFFE83D67)),
                    child: Center(
                      child: Text(
                        'Calculate',
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
            ],
          ),
        ),
      ),
    );
  }
}
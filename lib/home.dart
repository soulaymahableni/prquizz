import 'package:flutter/material.dart';
import 'quiz.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define the same color for both AppBar and Button
    final Color appBarAndButtonColor = const Color.fromARGB(255, 215, 121, 15);

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: appBarAndButtonColor, // Same color for AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add a back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigate to the previous page
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add an image from the assets (ensure you have this image in pubspec.yaml)
            Image.asset('assets/img/quiz.png', width: 400, height: 400),

            SizedBox(height: 30),

            // Add a button that navigates to the Quiz Page
            ElevatedButton(
              child: Text('Start Quiz'),
              style: ElevatedButton.styleFrom(
                backgroundColor: appBarAndButtonColor, // Same color for Button
              ),
              onPressed: () {
                // Navigate to the Quiz Page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

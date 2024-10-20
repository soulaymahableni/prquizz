import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int score = 0; // Variable to keep track of the score
  int questionIndex = 0; // To track the current question

  // List of 10 questions and answers
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'What is the color of the sky?',
      'answers': [
        {'text': 'Blue', 'score': 1},
        {'text': 'Red', 'score': 0},
        {'text': 'Green', 'score': 0}
      ],
    },
    {
      'questionText': 'What color are bananas?',
      'answers': [
        {'text': 'Yellow', 'score': 1},
        {'text': 'Purple', 'score': 0},
        {'text': 'Blue', 'score': 0}
      ],
    },
    {
      'questionText': 'What color is grass?',
      'answers': [
        {'text': 'Green', 'score': 1},
        {'text': 'Black', 'score': 0},
        {'text': 'Orange', 'score': 0}
      ],
    },
    {
      'questionText': 'Which is the smallest planet in our solar system?',
      'answers': [
        {'text': 'Mercury', 'score': 1},
        {'text': 'Venus', 'score': 0},
        {'text': 'Mars', 'score': 0}
      ],
    },
    {
      'questionText': 'How many continents are there on Earth?',
      'answers': [
        {'text': '6', 'score': 0},
        {'text': '7', 'score': 1},
        {'text': '8', 'score': 0}
      ],
    },
    {
      'questionText': 'Who wrote the play "Romeo and Juliet"?',
      'answers': [
        {'text': 'Charles Dickens', 'score': 0},
        {'text': 'William Shakespeare', 'score': 1},
        {'text': 'Leo Tolstoy', 'score': 0}
      ],
    },
    {
      'questionText': 'What is the capital of France?',
      'answers': [
        {'text': 'Berlin', 'score': 0},
        {'text': 'Madrid', 'score': 0},
        {'text': 'Paris', 'score': 1}
      ],
    },
    {
      'questionText': 'How many days are there in a leap year?',
      'answers': [
        {'text': '365', 'score': 0},
        {'text': '367', 'score': 0},
        {'text': '366', 'score': 1}
      ],
    },
    {
      'questionText': 'Which ocean is the largest?',
      'answers': [
        {'text': 'Pacific Ocean', 'score': 1},
        {'text': 'Atlantic Ocean', 'score': 0},
        {'text': 'Indian Ocean', 'score': 0}
      ],
    },
    {
      'questionText': 'What is the chemical symbol for water?',
      'answers': [
        {'text': 'H2O', 'score': 1},
        {'text': 'O2', 'score': 0},
        {'text': 'CO2', 'score': 0}
      ],
    },
  ];

  // Function to handle answer selection and update score
  void _answerQuestion(int score) {
    setState(() {
      this.score += score; // Update the score based on answer selected
      questionIndex += 1; // Move to the next question
    });
  }

  // Function to return the correct image based on the score
  Widget _getImageForScore() {
    if (score >= 8) {
      return Image.asset('assets/img/good_score.png'); // Good score image
    } else if (score >= 5) {
      return Image.asset('assets/average_score.png'); // Average score image
    } else {
      return Image.asset('assets/img/bad_score.png'); // Bad score image
    }
  }

  @override
  Widget build(BuildContext context) {
    // Define the same color for both AppBar and Buttons
    final Color appBarAndButtonColor = const Color.fromARGB(255, 215, 121, 15);

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Game'),
        backgroundColor: appBarAndButtonColor, // Same color for AppBar
      ),
      body: questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Display question
                Text(
                  _questions[questionIndex]['questionText'] as String,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),

                // Display answers
                ...(_questions[questionIndex]['answers']
                        as List<Map<String, Object>>)
                    .map((answer) {
                  return ElevatedButton(
                    onPressed: () => _answerQuestion(answer['score'] as int),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          appBarAndButtonColor, // Same color for Buttons
                    ),
                    child: Text(answer['text'] as String),
                  );
                }).toList(),
              ],
            )
          : Center(
              // When the quiz is finished, show the final score and image
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Finished! Your score is: $score',
                    style: TextStyle(fontSize: 28),
                  ),
                  SizedBox(height: 20),
                  _getImageForScore(), // Display the image based on score
                ],
              ),
            ),
    );
  }
}

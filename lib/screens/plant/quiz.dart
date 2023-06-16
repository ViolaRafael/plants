import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

void main() async {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  List<Question> questions = [];

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    String jsonData = await rootBundle.loadString('assets/questions.json');
    List<dynamic> jsonList = json.decode(jsonData);
    List<Question> loadedQuestions = jsonList.map((json) {
      String question = json['question'];
      List<String> answers = List<String>.from(json['answers']);
      int correctAnswerIndex = json['correctAnswerIndex'];
      return Question(question, answers, correctAnswerIndex);
    }).toList();

    setState(() {
      questions = loadedQuestions;
    });
  }

  void answerQuestion(int selectedAnswerIndex) {
    bool isCorrect = selectedAnswerIndex == questions[currentQuestionIndex].correctAnswerIndex;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? 'Resposta Correta' : 'Resposta Errada'),
          content: Text(isCorrect ? 'Parabéns, você acertou!' : 'Resposta errada, tente novamente.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (isCorrect) {
                  if (currentQuestionIndex < questions.length - 1) {
                    setState(() {
                      currentQuestionIndex++;
                    });
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Quiz Concluído'),
                          content: const Text('Você completou o quiz!'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  currentQuestionIndex = 0;
                                });
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                } else {
                  setState(() {
                    currentQuestionIndex = 0;
                  });
                }
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: Color(0xFF54845C),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0xFF54845C),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pergunta ${currentQuestionIndex + 1}:',
              style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              questions[currentQuestionIndex].questionText,
              style: const TextStyle(fontSize: 25.0),
            ),
            const SizedBox(height: 20.0),
            ...questions[currentQuestionIndex]
                .answers
                .asMap()
                .entries
                .map(
                  (entry) => AnswerButton(
                answerText: entry.value,
                isSelected: false,
                onPressed: () => answerQuestion(entry.key),
              ),
            )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String questionText;
  final List<String> answers;
  final int correctAnswerIndex;

  Question(this.questionText, this.answers, this.correctAnswerIndex);
}

class AnswerButton extends StatelessWidget {
  final String answerText;
  final bool isSelected;
  final VoidCallback onPressed;

  AnswerButton({
    required this.answerText,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFFF7E552),
          onPrimary: Colors.black,
        ),
        child: Text(
          answerText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

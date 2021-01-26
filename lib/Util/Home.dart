import 'package:flutter/material.dart';
import 'package:quizapp/Model/question.dart';

class quizapp extends StatefulWidget {
  @override
  _quizappState createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  int _currentquestionindex=0;
  List questionbank=[
    Question.name("National Animal of India","Tiger","cat","Tiger"),
    Question.name("National Bird of India", "Peacock","Parrot","Peacock"),
    Question.name("Prime minister of India","Manmohan Singh","Narendra Modi","Narendra Modi")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.grey,
      body: Builder(
        builder:(BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset("images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14.4),
                      border: Border.all(
                        color: Colors.blueGrey.shade700,style: BorderStyle.solid
                      )
                    ),
                    height: 120.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(questionbank[_currentquestionindex].questionText,style: TextStyle(
                        fontSize: 16.9,
                        color:Colors.white
                      ),),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(onPressed: ()=>_prevquestion(),
                    color:Colors.blueGrey.shade900,
                    child:Icon(Icons.arrow_back,color: Colors.white,),
                  ),
                  RaisedButton(onPressed: ()=>_nextquestion(),
                      color:Colors.blueGrey.shade900,
                      child:Icon(Icons.arrow_forward,color: Colors.white,),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: ()=>_checkanswer(questionbank[_currentquestionindex].ans1,context),
                      color:Colors.blueGrey.shade900,
                      child:Text(questionbank[_currentquestionindex].ans1,style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: ()=>_checkanswer(questionbank[_currentquestionindex].ans2,context),
                      color:Colors.blueGrey.shade900,
                      child:Text(questionbank[_currentquestionindex].ans2,style: TextStyle(color: Colors.white),)
                  ),
                ],
              ),

              Spacer()
            ],
          ),
        ),
      ),
    );
  }
  _checkanswer(String userchoice,BuildContext context){
    if(userchoice==questionbank[_currentquestionindex].correctans)
      {
        final snackbar=SnackBar(
          backgroundColor: Colors.blue,
            content: Text("$userchoice is the correct Answer"),
          duration: Duration(seconds: 2),
        );
        Scaffold.of(context).showSnackBar(snackbar);
      }
    else{
      final snackbar=SnackBar(
        backgroundColor: Colors.redAccent,
          content: Text("$userchoice is the wrong Answer"),
          duration: Duration(seconds: 2),
      );
      Scaffold.of(context).showSnackBar(snackbar);
    }
    _updateQuestion();

  }

  _updateQuestion(){
    setState(() {
      _currentquestionindex=(_currentquestionindex+1)%questionbank.length;
    });
  }

  _prevquestion(){
    setState(() {
      _currentquestionindex=(_currentquestionindex-1)%questionbank.length;
    });
  }

  _nextquestion() {
    _updateQuestion();
  }
}

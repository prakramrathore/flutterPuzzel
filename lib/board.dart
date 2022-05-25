import 'package:flutter/material.dart';
import 'package:flutter_puzzle/widget/grid.dart';
import 'package:flutter_puzzle/widget/imageWidget.dart';
import 'package:google_fonts/google_fonts.dart';

class board extends StatefulWidget {
  const board({Key? key}) : super(key: key);

  @override
  _boardState createState() => _boardState();
}

class _boardState extends State<board> {
  var number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15];
  int Moves = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          imageDisplay("assets/logo_flutter.png"),
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text("Puzzle Challenge",
                style: GoogleFonts.roboto(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(Moves.toString() + "Moves | 15 Tiles",
                style: GoogleFonts.roboto(
                  color: Colors.teal.shade900,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
          ),
          grid(number, onClick)
        ],
      ),
    ));
  }

  void onClick(index) {
    if (index - 1 >= 0 && number[index - 1] == 0 && index % 4 != 0 ||
        index + 1 < 16 && number[index + 1] == 0 && (index + 1) % 4 != 0 ||
        index - 4 >= 0 && number[index - 4] == 0 ||
        index + 4 < 16 && number[index + 4] == 0) {
      setState(() {
        number[number.indexOf(0)] = number[index];
        number[index] = 0;
        Moves++;
      });
    }
    checkWineer();
  }

  bool isShorted(List number) {
    int first = number.first;
    for (int i = 1; i < number.length; i++) {
      int nextNumber = number[i];
      if (first > nextNumber) return false;
      first = number[i];
    }
    return true;
  }

  void checkWineer() {
    bool isWinner = isShorted(number);
    if (isWinner) {
      print("Winner");
    } else
      print("Not yet!");
  }
}

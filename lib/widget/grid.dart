import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class grid extends StatelessWidget {
  grid(this.number, this.onClick, {Key? key}) : super(key: key);
  var number = [];
  Function onClick;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.5,
          width: MediaQuery.of(context).size.width * 0.8,
          child: GridView.builder(
              itemCount: number.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: (context, index) {
                return number[index] != 0
                    ? GestureDetector(
                        onTap: () {
                          onClick(index);
                        },
                        child: Card(
                          elevation: 10,
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: FittedBox(
                                child: Text(number[index].toString(),
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                            ),
                          ),
                        ))
                    : const SizedBox.shrink();
              }),
        ),
      ),
    );
  }
}

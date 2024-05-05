import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();

  double interest = 0;
  double total = 0;

  void calculation() {
    final calInterestRate = (double.parse(_controller2.text) / 100 / 12) *
        int.parse(_controller3.text);
    final calInterest = calInterestRate * int.parse(_controller1.text);
    setState(() {
      interest = calInterest;
      total = int.parse(_controller1.text) + interest;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
    
              Fluttertoast.showToast(
                msg: "Icon tapped!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            },
            child: const Icon(
              Icons.notes,
              size: 30,
              color: Colors.black,
            )),
        toolbarHeight: 30,
        backgroundColor: Colors.cyan,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
          )
        ],
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.grey[100],
        child: Column(
          children: [
            Container(
              height: 170,
              decoration: const BoxDecoration(
                  color: Colors.cyan,
                  borderRadius:
                      BorderRadius.only(bottomRight: Radius.circular(100))),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Fixed Deposit",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      ),
                      Text(
                        "CALCULATOR",
                        style: GoogleFonts.robotoMono(
                            fontSize: 35, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 40, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  inputForm(
                      title: "Deposit Amount :",
                      controller: _controller1,
                      hintText: "e.g 2000"),
                  inputForm(
                      title: "Annual Interest Rate(%) :",
                      controller: _controller2,
                      hintText: "e.g 3"),
                  inputForm(
                      title: "Period(in month) :",
                      controller: _controller3,
                      hintText: "e.g 3"),
                  const SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      calculation();
                    },
                    child: Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.cyan),
                      child: Center(
                        child: Text(
                          "Calculate",
                          style: GoogleFonts.robotoMono(
                              fontSize: 25, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Result :",
                        style: GoogleFonts.robotoMono(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Interest: RM " + interest.toStringAsFixed(2),
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Total : RM " + total.toStringAsFixed(2),
                          style: GoogleFonts.robotoMono(fontSize: 20),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget inputForm(
      {required String title,
      required TextEditingController controller,
      required String hintText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.robotoMono(fontSize: 20, color: Colors.cyan),
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(20)),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
                border: const OutlineInputBorder(borderSide: BorderSide.none),
                hintText: hintText),
          ),
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}

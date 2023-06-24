import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final todoControllerAddtasks= TextEditingController();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(255, 34, 34, 32),
      drawer: const Drawer(
        backgroundColor:Color.fromRGBO(28, 30, 19,1),
      ),

      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 34, 34, 32),
        leading: IconButton
        (
          icon: const Icon(CupertinoIcons.bars), 
          color: Colors.white,
          onPressed: () {_scaffoldKey.currentState?.openDrawer();},),
      ),

    body: Stack(
      children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(CupertinoIcons.home, color: Colors.white, size: 30,),
              Title(color: Colors.white, child: const Text(
                "Welcome home!",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30

                ),))
            ],
          ),
          line(Colors.white)
        ],
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          children: [
                Expanded(
                  child: Container(
                   margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
                   padding: const EdgeInsets.only(left: 20,right: 20,top: 5,bottom: 5),
                   decoration: BoxDecoration(
                     color: const Color.fromRGBO(12, 38, 70, 4),
                     borderRadius: BorderRadius.circular(17),
                     border: Border.all(
                       color: const Color.fromRGBO(42, 38, 48, 1),
                     ),
                     boxShadow: const [
                        BoxShadow(
                          spreadRadius: 0,
                          offset: Offset(0, 0),
                          blurRadius: 10,
                        ),
                     ],
                   ),
                child: TextField(
                  cursorColor: Colors.amber[900],
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      controller: todoControllerAddtasks,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        
                    ),
                  )
                )
              ),
            Container(
              margin: const EdgeInsets.only(right: 20,bottom: 20),
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: ElevatedButton (
                onPressed: () {
                  null;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(12, 38, 70, 1),
                  elevation: 30,
                  shadowColor: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17)
                ),
              ),
                child: const Text("+", style: TextStyle(fontSize: 40, color: Colors.white,)),
              )
            )
          ],
        ),
      )
    ]),

    );
  }

  Widget line(Color color) {
    return Container(
            color: color,
            height: 2,
            width: MediaQuery.of(context).size.width,
          );
  }
} 

import 'package:audioplayers/audioplayers.dart';
import 'package:ebook_app/audio_file.dart';
import 'package:flutter/material.dart';

class AudioPage extends StatefulWidget {
  const AudioPage({Key? key}) : super(key: key);

  @override
  State<AudioPage> createState() => _AudioPageState();

}
class _AudioPageState extends State<AudioPage> {

   late AudioPlayer advancedPlayer;

  @override void initState(){
    super.initState();
    advancedPlayer=AudioPlayer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height:200,
              child: Container(
                color: Colors.blue,
              )),
          Positioned(
              top:10,
              left: 0,
              right: 0,
              height: 200,
              child: AppBar(
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                  onPressed: () =>Navigator.of(context).pop(),
                ),
                actions: [
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                    ),
                    onPressed: () {},
                  )
                ],
                elevation: 0.3,
              )),
          Positioned(
              top: 150,
              left: 0,
              right: 0,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: Column(
                  children:[
                    const SizedBox(
                      height: 100,
                    ),
                    const Text(
                      "THE WATER BURE",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Avenir",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Martin Haya",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Avenir",
                      ),
                    ),
                   AudioFile(advancedPlayer: advancedPlayer),
                  ],
                ),
              )),
          Positioned(
            top:100,
            left:120,
            right: 120,
            height: 130,
            child: Container(

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2),
                color: Colors.black38,),

              child: Padding(
                    padding:  const EdgeInsets.all(10),
                  child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white,width:0.5 ),

                      image: const DecorationImage(
                        image: AssetImage("img/pic-1.png"),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

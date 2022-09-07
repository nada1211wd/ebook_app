import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class AudioFile extends StatefulWidget {
  final AudioPlayer advancedPlayer;
  const AudioFile({Key? key, required this.advancedPlayer}) : super(key: key);

  @override
  State<AudioFile> createState() => _AudioFileState();
}

class _AudioFileState extends State<AudioFile> {
  late Duration _duration = const Duration();
  late Duration _position = const Duration();
  // final Source path =
  //     "https://www.bing.com/videos/search?q=%D8%A7%D8%BA%D9%86%D9%8A%D9%87+%D9%84%D8%A7+%D9%85%D9%84%D8%A7%D9%85%D9%87&&view=detail&mid=401B06EF862B72DBF8DA401B06EF862B72DBF8DA&&FORM=VRDGAR&ru=%2Fvideos%2Fsearch%3Fq%3"
  //         as Source;
  bool isPlaying = false;
  bool isPaused = false;
  bool isLoop = false;
  final List<IconData> _icons = [
    Icons.play_circle_fill,
    Icons.pause_circle_filled,
  ];

  @override
  void initState() {
    super.initState();
    widget.advancedPlayer.onDurationChanged.listen((d) {
      setState(() {
        _duration = d;
      });
    });
    widget.advancedPlayer.onDurationChanged.listen((p) {
      setState(() {
        _position = p;
      });
    });

    // widget.advancedPlayer.setSource(path);
  }

  void changeToSecond(int second) {
    Duration newDuration = Duration(seconds: second);
    widget.advancedPlayer.seek(newDuration);
  }



  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(

      children: [

        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _position.toString(),
                style: const TextStyle(fontSize: 13),
              ),
              Text(
                _position.toString(),
                style: const TextStyle(fontSize: 13),
              ),



            ],
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

             Padding(
              padding: const EdgeInsets.only(top: 1),

              child: Slider(
                  activeColor: Colors.red,
                  inactiveColor: Colors.grey,
                  value: _position.inSeconds.toDouble(),
                  min: 0.0,
                  max: _duration.inSeconds.toDouble(),
                  onChanged: (double value) {
                    setState(() {
                      changeToSecond(value.toInt());
                      value = value;
                    });
                  })
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                IconButton(
                  padding: const EdgeInsets.only(bottom: 10,left: 15,right: 25,),
                  color: Colors.grey,
                  icon: const Icon(Icons.repeat),
                  onPressed: () {},
                ),

                IconButton(
                  padding: const EdgeInsets.only(bottom: 10,left: 25,right: 25,),
                  color: Colors.grey,
                  icon: const Icon(Icons.fast_forward),
                  onPressed: () {},
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 10,left: 25,right: 25,),
                  color: Colors.blue,
                  icon: const Icon(Icons.play_circle_fill),
                  onPressed: () {},
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 10,left: 25,right: 25,),
                  color: Colors.grey,
                  icon: const Icon(Icons.fast_rewind),
                  onPressed: () {},
                ),
                IconButton(
                  padding: const EdgeInsets.only(bottom: 10,left: 25,right: 25,),
                  color: Colors.grey,
                  icon: const Icon(Icons.loop),
                  onPressed: () {},
                ),

              ],
            ),




          ],


        ),


        ),

      ],
    ),





    );
  }
}

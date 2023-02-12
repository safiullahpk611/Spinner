import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinning_wheel/flutter_spinning_wheel.dart';
import 'package:provider/provider.dart';
import 'package:spinzy/core/constant/colors.dart';
import 'package:spinzy/ui/custom_widgets/custom_button.dart';

import '../../../core/enums/view_state.dart';
import '../home/home_provider.dart';



class SpaningWheel extends StatefulWidget {
  const SpaningWheel({Key? key}) : super(key: key);

  State<SpaningWheel> createState() => _SpaningWheelState();
}

class _SpaningWheelState extends State<SpaningWheel> {

//  final StreamController dividerController = StreamController<int>();
 StreamController<int> dividerController = StreamController.broadcast();
  final wheelNotifier = StreamController<double>();
 @override
  dispose() {
   print(">>>>>>>>>>Disposing is called");
    super.dispose();
dividerController.close();
  wheelNotifier.close();
  }
 onWeelStop(val)  {

    dividerController.add;
    onEnd = true;
    setState(() {
      
    });



  }
onEndfun(val){
    onEnd=val;
     setState(() {
      
    });
}

  @override
  Widget build(BuildContext context) {
   
    ///
    /// status bar color
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.blueAccent,
        statusBarBrightness: Brightness.light,
      ),
    );
    return ChangeNotifierProvider(create: (context) {
      return HomeScreenProvider();
    }, child: Consumer<HomeScreenProvider>(builder: (context, model, child) {

      return Stack(
        alignment: Alignment.center,
        children: [
          Scaffold(
       
        body: SafeArea(
          child: Container (
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/appBackgroundImage.png"),
                    fit: BoxFit.cover),
                // gradient: LinearGradient(
                //     begin: Alignment.topLeft,
                //     end: Alignment.bottomRight,
                //     colors: [Color(0x2E8BFF), Color(0xFFFFA756)])),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                      
                 
                
                  Image.asset(
                    'assets/images/spin_the_wheel.png',
                    width: 250,
                  ),

                  SpinningWheel(
                    Image.asset(
                      'assets/images/roulette-8-300.png',
                    ),
                    height: 320,
                    width: 320,
                    initialSpinAngle: 0.1,
                    spinResistance: 0.2,
                    canInteractWhileSpinning: false,
                    dividers: 8,
                    onUpdate: dividerController.add,
                    onEnd: onWeelStop,
                    secondaryImage:
                        Image.asset('assets/images/roulette-center-300.png'),
                    secondaryImageHeight: 110,
                    secondaryImageWidth: 110,
                    shouldStartOrStop: model.wheelNotifier.stream,
                  ),
                  const SizedBox(height: 20),
             InkWell(
                    onTap: () {
                      model.wheelNotifier.sink.add(_generateRandomVelocity());


                    onEnd=true;
                      onEndfun(false);
                    



                    },
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 7,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,


                            colors: [Color(0xffAC03FB), Color(0xFFD3B0FF )]),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white,
                            offset: const Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 2.0,
                            spreadRadius: 2.0,
                          ), //BoxShadow//BoxShadow
                        ],
                      ),
                      child: Center(
                        child: const Text(
                          "Spin",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: "BurgerQueen"),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //     padding: const EdgeInsets.symmetric(horizontal: 80),
                  //     child: CustomButton(
                  //       buttonTitle: 'Spin',
                  //       onPress: () async {
                  //         _wheelNotifier.sink.add(_generateRandomVelocity());
                  //         Future.delayed(Duration(seconds: 5));
                  //
                  //         check = true;
                  //         onEnd=false;
                  //
                  //         setState(() {});
                  //       },
                  //     )),
                  const SizedBox(height: 20),
                  // onEnd
                  //     ? Expanded(
                  //       child: Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 20),
                  //           child: StreamBuilder(
                  //             stream: model.dividerController.stream,
                  //             builder: (context, snapshot) => snapshot.hasData
                  //                 ? RouletteScore(snapshot.data)
                  //                 : Container(),
                  //           ),
                  //         ),
                  //     )
                  //     : SizedBox(),
                  //     ,
                  // Container(
                  //   child: onEnd==true?Lottie.asset('assets/lotti/55867-congratulation.json'):SizedBox(),
                  // ),


              onEnd
                      ? Expanded(
                        child: Container(

                          child: Align(
                    alignment: Alignment.bottomCenter,
                            child: CustomButton(
                              buttonTitle: 'Claim',
                              onPress: () {
                                // model.getData(context);
                              },
                            ),
                          ),
                        ),
                      )
                      : const SizedBox(),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    

        ],
      );
    }));
  }
}

double _generateRandomVelocity() => (Random().nextDouble() * 6000) + 2000;

double _generateRandomAngle() => Random().nextDouble() * pi * 2;

class RouletteScore extends StatelessWidget {
  final int selected;

  final Map<int, String> labels = {
    1: '1000\$',
    2: '400\$',
    3: '800\$',
    4: '7000\$',
    5: '5000\$',
    6: '300\$',
    7: '2000\$',
    8: '100\$',
  };

  RouletteScore(this.selected);

  @override
  Widget build(BuildContext context) {
    // print("${selected}>>>>");
    return Text('You have won : ${labels[selected]}',
        style: TextStyle(
          color: primaryColor,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ));
  }
}
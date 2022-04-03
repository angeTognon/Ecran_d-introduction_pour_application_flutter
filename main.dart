import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'accueil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: const Color(0xFF202328),
            accentColor: const Color(0xFF63CF93),
            backgroundColor: const Color(0xFF121710)
        ),
        home: ecran_introduction()
    );
  }
}
class ecran_introduction extends StatefulWidget {
  const ecran_introduction({ Key? key }) : super(key: key);

  @override
  State<ecran_introduction> createState() => _ecran_introductionState();
}

class _ecran_introductionState extends State<ecran_introduction> {

  //Création des variables : 
  final controller = PageController();

  bool dernierPage = false;

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Box du bas
      bottomSheet: Container(
        height: 60,
        child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Boutton 1
            TextButton(onPressed: ()=>controller.jumpToPage(4), child: const Text("IGNORER", style : TextStyle(
              fontWeight: FontWeight.bold,
              color : Colors.blueGrey
            )
            )),

            //Ajout de l'indicateur de page : 
            Center(
              child : SmoothPageIndicator(
                count : 4, controller: controller,
              )
            ),
            // Boutton 2
            // si nous somme à la dernière page, alors afficher le bouton COMMENCER
            dernierPage?
            TextButton(onPressed: ()=> 
            {
              dernierPage = true,
              Navigator.push(context, MaterialPageRoute(builder: (context)=>accueil()))
            }
              
            , child: const Text("Commancer", style : TextStyle(
              fontWeight: FontWeight.bold,
              color : Colors.blueGrey
            )
            )): //SInon afficher bouton suivant 
            TextButton(onPressed: ()=> controller.nextPage(
              duration: const Duration(seconds: 1), curve: Curves.easeInOut)
              //Si on clique sur le bouton suivant , alors aller à la page suivante :
              
            , child: const Text("SUIVANT", style : TextStyle(
              fontWeight: FontWeight.bold,
              color : Colors.blueGrey
            )
            )),

          ],
        ),
      ),

      body:  Container(
        padding: const EdgeInsets.only(bottom: 60),
        child: PageView(
          controller: controller,
          onPageChanged: (index)
          {
            setState(() => dernierPage = index ==3);
          },
          children: [
            //Premier page : 
            Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children:  [
                const SizedBox(height: 40),
                // Ajout de l'image
                Image.asset("assets/images/image1.png"),
                const SizedBox(height: 40),
                //Ajout du titre : 
                const Text("Soyez la Bienvenue sur notre application ", style: TextStyle(
                  fontSize: 20,),textAlign: TextAlign.center,),
                  const SizedBox(height: 20),
                //Ajout de la Description : 
                Text("Commandez vos Sites web et Application, via notre plateform",textAlign: TextAlign.center,)
              ],
            ),
            ),

             //2ième page : 
            Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children:  [
               const SizedBox(height: 40),
                // Ajout de l'image
                Image.asset("assets/images/image2.png"),
                const SizedBox(height: 40),
                //Ajout du titre : 
                Text("Titre 2", style: TextStyle(fontSize: 20,),),
                const SizedBox(height: 40),
                //Ajout de la Description : 
                Text("Description 2 ")
              ],
            ),
            ),

              //3ième page : 
            Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children:  [
                const SizedBox(height: 40),
                // Ajout de l'image
                Image.asset("assets/images/image3.png"),
                const SizedBox(height: 40),
                //Ajout du titre : 
                const Text("Titre 3", style: TextStyle(fontSize: 20,),),
                const SizedBox(height: 40),
                //Ajout de la Description : 
                Text("Description 3 ")
              ],
            ),
            ),

              //4ième page : 
            Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children:  [
                const SizedBox(height: 20),
                // Ajout de l'image
                Image.asset("assets/images/img_4.png", scale: 10,),
                //Ajout du titre : 
                Text("Page 4", style: TextStyle(fontSize: 20,),),
                //Ajout de la Description : 
                Text("N'oubliez pas de vous abonner et de liker si la vidéo vous a plus ")
              ],
            ),
            ),

          ],
        ),
      ),
    );
  }
}
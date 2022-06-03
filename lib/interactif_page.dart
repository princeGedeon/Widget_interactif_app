import 'package:flutter/material.dart';

class InteractifPage extends StatefulWidget{

  @override
  InteractifPageState createState()=>InteractifPageState();





}

class  InteractifPageState extends State<InteractifPage>
{
  String prenom="";
  Color backgrouncolor=Colors.white;
  Color textColor=Colors.black12;
  bool textChanged=false;
  bool switchValue=true;
  late TextEditingController controller;
  @override
  void initState()
  {
    super.initState();
    controller=TextEditingController();
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();

  }
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      backgroundColor:backgrouncolor ,
      appBar: AppBar(
        title: Text(updateBarText()),

      ),
      body: Center(
        child: Column(
          children: [
            TextButton(onPressed: updateAppBar, child: Text("Je suis un textButton")),
            ElevatedButton(onPressed: (){print("Cool");}, child: const Text("Elevated"),style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              elevation: 15,
            ),),
            IconButton(onPressed: (){
              print("Dja");
            }, icon: Icon(Icons.favorite)),

            TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Entrer une valeur"),
              onChanged: (newString){
                setState((){
                  print("Done");

                });

              },
            ),
            Text(controller.text),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text((switchValue)?"J'aime les chiens":"Les chiens sont bizzare"),
                Switch(value: switchValue, onChanged: ((bool){
                  setState((){
                    switchValue=bool;
                  });
                }))
              ],
            )

          ],

        )


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: updateColors,



        child: Icon(Icons.build),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }

  void updateColors() {
    setState(() {
      backgrouncolor =
      (backgrouncolor == Colors.white) ? Colors.black12 : Colors.white;
      textColor = (textColor == Colors.black12) ? Colors.white : Colors.black12;
    });
  }

  String updateBarText()
  {
    return (textChanged)?"Je m'y connais":"Les interactifs";
  }

  void updateAppBar()
  {
    setState((){
      textChanged=!textChanged;
    });
  }
}


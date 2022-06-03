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
  double sliderValue=20;
  DateTime initialDate=DateTime.now();
  bool chek=false;
  late TextEditingController controller;
  Map<String,bool> courses={
    "Tomate":false,
    "Oignon":true,
    "Magaretta":false,
    "Piment":true
  };
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
              showDatePicker(context: context, initialDate: initialDate, firstDate: DateTime(1978), lastDate: DateTime(2090)).then((value) => {
                if(value!=null)
                  {
                    setState((){
                     initialDate=value;
                     print(value);
                    })
                  }
              });
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
            ),
            Slider(thumbColor: Colors.greenAccent,min:0,max:100,value: sliderValue, onChanged: ((newValue){
              setState((){
                sliderValue=newValue;
              });
            })),
            Text(sliderValue.toString()),
            Checkbox(value: chek, onChanged: (newBool){
              setState((){
                chek=newBool??false;
              });
            }),
            checks(),
            Radio(value: 0, groupValue: 1, onChanged: ((newValue){

            }))
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

  Column checks(){
    List<Widget> items=[];
    courses.forEach((course, achete) {
      Widget row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(course),
          Checkbox(value: achete, onChanged: ((newValue) {
            setState(() {
              courses[course] = newValue ?? false;
            });
          }))
        ],
      );
      items.add(row);

    });
      return Column(children: items);


    }
}

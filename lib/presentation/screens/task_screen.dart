import 'package:flutter/material.dart';
import 'package:todo/presentation/widgets/container_widget.dart';
import 'package:todo/presentation/widgets/text_widget.dart';
import 'package:todo/presentation/widgets/textfield_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController controller=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Column(
          children: [
            TextWidget(text: 'Hello'),
            TextWidget(
              text: 'Mellos',
              fontSize: 16,
              fontWeight: FontWeight.bold,
            )
          ],
        ),  
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ContainerWidget(
            height: 10,
            width: 10,           
            color: Colors.yellow,
            shape: BoxShape.circle,
            child: TextWidget(text:'Derto'),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: ClipOval(
              child: ContainerWidget(             
                height: 28,
                width: 28,  
                border: Border.all(
                  color:Color(0xffD4D4D4)
                ),        
                shape: BoxShape.circle,
                color: Colors.white,
                child: IconButton(
                  padding: EdgeInsets.all(0),
                onPressed:(){}, 
                icon:Icon(Icons.menu,size:20)),
              ),
            ),
          )
          
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextfieldWidget(
            hintText: 'find Your task here..',
            controller: controller,
            lebel: Icon(Icons.search,size: 25,),)
        ],),
    );
  }
}

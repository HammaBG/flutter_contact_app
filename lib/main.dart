import 'package:app_liste/Contact.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home() ,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Contact> lstContacts = [
    new Contact("Boughnimi", "Mohamed Amine", "26030811", "assets/images/avatar1.jpg"),
    new Contact("Boughnimi", "Oussama", "26030811", "assets/images/avatar2.jpg"),
    new Contact("Boughnimi", "Nadia", "26030811", "assets/images/avatar3.jpg"),
    new Contact("Boughnimi", "Anas", "26030811", "assets/images/avatar4.jpg"),
    new Contact("Boughnimi", "Amal", "26030811", "assets/images/avatar5.jpg"),
    new Contact("Boughnimi", "Habib", "26030811", "assets/images/avatar6.jpg"),
    new Contact("Boughnimi", "Ahmed", "26030811", "assets/images/avatar7.gif"),
    new Contact("Boughnimi", "Omar", "26030811", "assets/images/avatar8.jpg"),
  ];
  showAlertDialog(BuildContext context, String message){
    Widget cancelButton = TextButton(child: Text("Cancel"),onPressed: () {},
    );
    Widget continueButton = TextButton(child: Text("Continue"),onPressed: () {},
    );
    AlertDialog alert = AlertDialog(
      title: Text("AlertDialog"),
      content: Text(message),
      actions: [cancelButton ,  continueButton],
    );
    showDialog(context: context, builder: (BuildContext context)
    {
      return alert;
    },
    );
  }
  List<String> images = [
    "assets/images/avatar1.jpg",
    "assets/images/avatar2.jpg",
    "assets/images/avatar3.jpg",
    "assets/images/avatar4.jpg",
    "assets/images/avatar5.jpg",
    "assets/images/avatar6.jpg",
    "assets/images/avatar7.gif",
    "assets/images/avatar8.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(lstContacts[index].photo),
            ),
            title: Text(lstContacts[index].nom + " " + lstContacts[index].prenom),
            subtitle: Text(lstContacts[index].tel),
            trailing: IconButton(icon: Icon(Icons.call) , onPressed: () {

            },),
            onTap: () {
              //showAlertDialog(context, lstContacts[index].prenom);
              Fluttertoast.showToast(msg: lstContacts[index].prenom,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              FlutterPhoneDirectCaller.callNumber(lstContacts[index].tel);
            },
          ),
        );
      },
        itemCount: lstContacts.length,
        shrinkWrap: true,
        padding: EdgeInsets.all(5),
        scrollDirection: Axis.vertical,
      )
    );
  }
}


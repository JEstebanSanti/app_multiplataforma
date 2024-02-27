// ignore_for_file: unnecessary_const

import 'dart:developer' as developer;

import 'package:flutter/material.dart';

import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:proyectos/contactos.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  bool isNameValid = false;
  bool isPhoneValid = false;
  late String phoneIso;
  List <Contact> contactos = [
   
  ];
  int? indexEdit;
  String initialCountry = 'EN';
  PhoneNumber number = PhoneNumber(isoCode: 'EN');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Lista de Contactos"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            TextField(
              onChanged: (values) {
                if(values.trim().isEmpty) {isNameValid = false; } else { isNameValid = true;}
                developer.log(isNameValid.toString(), name: "IsNameVAlid");

              },
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person),
                hintText: "nombre del contacto",
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    ),
                  ),
              ),
            ),
            const SizedBox(height: 10,),
            InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  phoneIso = number.phoneNumber!;
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                  isPhoneValid = value;
                },
                selectorConfig: const SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  useBottomSheetSafeArea: true,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: const TextStyle(color: Colors.black),
                
                inputDecoration: InputDecoration(
                hintText: "numero de contacto",
                filled: true,
                fillColor: Colors.grey[200],
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none
                    ),
                  ),
              ),
                initialValue: number,
                textFieldController: phoneController,
                formatInput: true,
                keyboardType:
                    const TextInputType.numberWithOptions(signed: true, decimal: true),
                
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    if(isNameValid && isPhoneValid){
                      final String name = nameController.text;
                      if(indexEdit == null){
                        //addd
                        contactos.add(Contact(name: name, phone: phoneIso));
                      
                      }else {
                        //upadte
                        contactos[indexEdit!] = Contact(name: name, phone: phoneIso);
                      }
                        FocusScope.of(context).unfocus();
                        nameController.clear();
                        phoneController.clear();
                        isNameValid = false;
                        isPhoneValid = false;
                        setState(() {});
                        indexEdit = null;
                    }else{
                      showDialog<String>(
                        context: context, 
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Te ha Faltado algo ...'),
                          content: const Text('Algun parametro Quizas... 😂'),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context, 'OK'),
                                child: const Text('OK'),
                              ),
                          ],
                        ),
                      );
                    }
                  }, 
                  child: const Text("Guardar")),
                TextButton(
                  onPressed: (){
                      FocusScope.of(context).unfocus();
                      nameController.clear();
                      phoneController.clear();
                      isNameValid = false;
                      isPhoneValid = false;
                  }, 
                  child: const Text("Cancelar"))
              ],
            ),
            const SizedBox(height: 40,),
            Expanded(
              child: ListView.builder(
                itemCount: contactos.length,
                itemBuilder: (context, index){
                  return mylistType(index);
                },
            ),)
         ]),
      ),
    );
  }


  Widget mylistType(int index) {
    final contactIndex = contactos[index];
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.primaries[contactIndex.name.length],
          child: Text(contactIndex.name[0]),
          ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(contactIndex.name),
              Text(contactIndex.phone),
            ]
          ),
          trailing: SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    //update
                    onTap: () async {
                      nameController.text = contactIndex.name;
                      phoneController.text = contactIndex.phone;
                      indexEdit = index;
                      PhoneNumber number = await PhoneNumber.getRegionInfoFromPhoneNumber(contactIndex.phone);
                      setState(() {
                        this.number = number;
                      });
                    },
                    child: const Icon(Icons.edit)
                  ),
                  InkWell(
                      onTap: () {
                        contactos.removeAt(index);
                        setState(() {});
                      },
                      child: const Icon(Icons.remove_circle_outline_outlined),
                  ),
                ]
              ),
          ),
        ),
    );
  }
}
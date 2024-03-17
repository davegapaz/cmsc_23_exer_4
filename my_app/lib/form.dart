import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/agetextfield.dart';
import 'package:my_app/dropdown.dart';
import 'package:my_app/nametextfield.dart';
import 'package:my_app/nicknametextfield.dart';
import 'package:my_app/radiobutton.dart';
import 'package:my_app/sliderbutton.dart';
import 'package:my_app/switchbutton.dart';

class FormSample extends StatefulWidget {
  const FormSample({super.key});

  @override
  State<FormSample> createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  Widget? nameWidget;
  bool validate = false;
  String name = "";
  String nickname = "";
  String age = "";
  double happinesslevel = 0;
  String opt = "";
  String motto = "";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: formKey,
      child: Column(
        children: [
          const Text(
            "The Tita Slambook",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          // ButtonSample(),
          NameTextFieldSample((nameValue) => name = nameValue),
          const SizedBox(
            height: 33,
          ),
          NicknameTextField((nicknameVal) => nickname = nicknameVal),
          const SizedBox(
            height: 33,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Flexible(child: AgeTextField((ageValue) => age = ageValue)),
              const SizedBox(
                width: 15,
              ),
              const Text(
                "In a Relationship?",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(width: 25),
              SwitchWidget(),
            ],
          ),
          const SizedBox(height: 33),
          const Text(
            "Happiness Level",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("On a scale of 1-10, gaano kasaya ang adulting?",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
          SliderButton((happinessValue) => happinesslevel = happinessValue),
          const SizedBox(height: 33),
          const Text(
            "Superpower",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const Text("If you were to have a superpower, what would it be?",
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 15)),
          Dropdown(),
          const SizedBox(height: 33),
          const Text("Motto",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          RadioButton((mottoValue) => motto = mottoValue),
          OutlinedButton(
              onPressed: () {
                //
                if (formKey.currentState!.validate()) {
                  print("succes");
                  formKey.currentState!.save();
                  setState(() {
                    validate = true;
                  });
                } else {
                  print('Failed');
                }
              },
              child: Text("Add", style: TextStyle(fontSize: 20))),

          SizedBox(height: 33),
          if (validate == true)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  const Text("Summary",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Name:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(name)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nickname:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(nickname)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Age:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(age)
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Happiness Level:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(happinesslevel.toString())
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Dropdown.getSuperpowers()],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Motto:",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      Text(motto)
                    ],
                  ),
                ],
              ),
            ),
          OutlinedButton(
            onPressed: () {
              // Reset the form
              formKey.currentState!.reset();

              // Reset the submit clicked flag
              setState(() {
                validate = false;

                Dropdown.setOpt("Makalipad");
              });
            },
            child: Text('Clear'),
          ),
        ],
      ),
    ));
  }
}

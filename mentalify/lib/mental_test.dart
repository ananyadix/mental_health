import 'package:flutter/material.dart';
import 'package:mentalify/navbar.dart';
import 'package:tflite/tflite.dart';
import 'dart:typed_data';

class MentalTest extends StatefulWidget {
  const MentalTest({super.key});

  @override
  State<MentalTest> createState() => _MentalTestState();
}

class _MentalTestState extends State<MentalTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Take this mental test and know about your mental condition:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: MyForm(),
          ),
        ],
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  void initState() {
    super.initState();
    loadModel();
  }

  Future<void> loadModel() async {
    String? res = await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
    if (res != null) {
      print(res);
    } else {
      print("Failed to load the model");
    }
  }

  Future<void> predict(List<double> inputData) async {
    // Convert inputData to Uint8List
    Uint8List inputBytes = Uint8List.fromList(
      inputData.map((e) => e.toInt()).toList(),
    );

    var output = await Tflite.runModelOnBinary(
      binary: inputBytes,
      // Remove `numThreads` if your TFLite package version doesn't support it
      threshold: 0.5,
    );

    if (output != null && output.isNotEmpty) {
      double confidence = output[0]['confidence'];
      String label = output[0]['label'];
      if (label == "yes") {
        showYesPopup();
      } else {
        showNoPopup();
      }
    }
  }

  void showYesPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("You are diagonosed with stress and anxiety issues"),
          content: Text("Don't worry we have our experts to take your complete care"),
          actions: <Widget>[
            TextButton(
              child: Text("Connect with our Experts"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void showNoPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Congrats! you are not suffering from any kind of stress or anxiety issue"),
          content: Text("To keep your mental health up to date always follow these stress busters"),
          actions: <Widget>[
            TextButton(
              child: Text("Stress Busters"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void handleSubmit() {
    // Gather form data and preprocess it
    List<double> inputData = gatherFormData();

    // Make prediction
    predict(inputData);
  }

  List<double> gatherFormData() {
    // Convert form inputs to numerical values suitable for the model
    return [
      _age.toDouble(),
      _selectedGender == 'Male' ? 1.0 : 0.0,
      _selectedFamilyHistory == 'Yes' ? 1.0 : 0.0,
      _selectedLevel == 'Somewhat easy' ? 1.0 : (_selectedLevel == "Don't know" ? 2.0 : 3.0),
      _selectedWorkInterfere == 'Often' ? 1.0 : (_selectedWorkInterfere == 'Rarely' ? 2.0 : (_selectedWorkInterfere == 'Never' ? 3.0 : (_selectedWorkInterfere == 'Sometimes' ? 4.0 : 5.0))),
      _selectedCareOptions == 'Yes' ? 1.0 : (_selectedCareOptions == 'No' ? 2.0 : 3.0),
      _selectedAnonymity == 'Yes' ? 1.0 : (_selectedAnonymity == "Don't know" ? 2.0 : 0.0),
      _selectedBenefits == 'Yes' ? 1.0 : (_selectedBenefits == "Don't know" ? 2.0 : 0.0)
    ];
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int _age = 0;
  String? _selectedGender;
  String? _selectedFamilyHistory;
  String? _selectedLevel;
  String? _selectedWorkInterfere;
  String? _selectedCareOptions;
  String? _selectedAnonymity;
  String? _selectedBenefits;

  final List<String> _genders = ['Male', 'Female', 'Others'];
  final List<String> _familyHistory = ['Yes', 'No'];
  final List<String> _level = ['Somewhat easy', "Don't know", 'Somewhat difficult', 'Very difficult', 'Very easy'];
  final List<String> _workInterfere = ['Often', 'Rarely', 'Never', 'Sometimes', "Don't know"];
  final List<String> _careOptions = ['Not sure', 'No', 'Yes'];
  final List<String> _anaonymity = ['Yes', "Don't know", 'No'];
  final List<String> _benefits = ['Yes', "Don't know", 'No'];

  void _submitForm() {
    // Check if the form is valid
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save(); // Save the form data
      // You can perform actions with the form data here and extract the details
      print('Age: $_age');
      print('Gender: $_selectedGender');
      print('Family history: $_selectedFamilyHistory');
      print('Level: $_selectedLevel');
      print("Work Interfere: $_selectedWorkInterfere");
      print("Care option: $_selectedCareOptions");
      print("Anonymity: $_selectedAnonymity");
      print("Benefits: $_selectedBenefits");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: "Enter your age:",
                prefixIcon: Icon(Icons.calendar_today),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter your age";
                }
                return null;
              },
              onSaved: (value) {
                _age = int.parse(value!);
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select your gender:",
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder(),
              ),
              value: _selectedGender,
              items: _genders.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select your gender";
                }
                return null;
              },
              onSaved: (value) {
                _selectedGender = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Stressful condition management",
                helperText: "How easy or difficult is it to manage stressful conditions?",
                prefixIcon: Icon(Icons.manage_history_outlined),
                border: OutlineInputBorder(),
              ),
              value: _selectedLevel,
              items: _level.map((String level) {
                return DropdownMenuItem<String>(
                  value: level,
                  child: Text(level),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLevel = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select how you manage stressful conditions";
                }
                return null;
              },
              onSaved: (value) {
                _selectedLevel = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Mental stress and work",
                helperText: "Does mental stress create any problems during your work?",
                prefixIcon: Icon(Icons.work),
                border: OutlineInputBorder(),
              ),
              value: _selectedWorkInterfere,
              items: _workInterfere.map((String workInterfere) {
                return DropdownMenuItem<String>(
                  value: workInterfere,
                  child: Text(workInterfere),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedWorkInterfere = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select if mental stress affects your work";
                }
                return null;
              },
              onSaved: (value) {
                _selectedWorkInterfere = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Mental health care",
                helperText: "Have you taken any care for your mental health?",
                prefixIcon: Icon(Icons.health_and_safety),
                border: OutlineInputBorder(),
              ),
              value: _selectedCareOptions,
              items: _careOptions.map((String careOptions) {
                return DropdownMenuItem<String>(
                  value: careOptions,
                  child: Text(careOptions),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedCareOptions = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select if you have taken any mental health care";
                }
                return null;
              },
              onSaved: (value) {
                _selectedCareOptions = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Sharing mental issues",
                helperText: "Have you shared any mental issues with anyone?",
                prefixIcon: Icon(Icons.share),
                border: OutlineInputBorder(),
              ),
              value: _selectedAnonymity,
              items: _anaonymity.map((String anaonymity) {
                return DropdownMenuItem<String>(
                  value: anaonymity,
                  child: Text(anaonymity),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAnonymity = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select if you have shared mental issues";
                }
                return null;
              },
              onSaved: (value) {
                _selectedAnonymity = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Mental health benefits",
                helperText: "Did any help give you any benefit?",
                prefixIcon: Icon(Icons.help),
                border: OutlineInputBorder(),
              ),
              value: _selectedBenefits,
              items: _benefits.map((String benefits) {
                return DropdownMenuItem<String>(
                  value: benefits,
                  child: Text(benefits),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedBenefits = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select if you received any benefits";
                }
                return null;
              },
              onSaved: (value) {
                _selectedBenefits = value;
              },
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Family history of stress or anxiety",
                helperText: "Do you have any family history related to stress or anxiety issues?",
                prefixIcon: Icon(Icons.family_restroom),
                border: OutlineInputBorder(),
              ),
              value: _selectedFamilyHistory,
              items: _familyHistory.map((String familyHistory) {
                return DropdownMenuItem<String>(
                  value: familyHistory,
                  child: Text(familyHistory),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedFamilyHistory = newValue;
                });
              },
              validator: (value) {
                if (value == null) {
                  return "Please select if you have a family history of stress or anxiety";
                }
                return null;
              },
              onSaved: (value) {
                _selectedFamilyHistory = value;
              },
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: handleSubmit,
              child: Text('Submit'),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                backgroundColor: Colors.indigo[400], // Corrected property for button color
              ),
            ),
          ],
        ),
      ),
    );
  }
}












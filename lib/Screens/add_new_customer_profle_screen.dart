import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vkyc/NetworkAPI/AddNewCustomerAPICall.dart';

class AddNewCustomerProfileScreen extends StatefulWidget {
  const AddNewCustomerProfileScreen({Key? key}) : super(key: key);

  @override
  _AddNewCustomerProfileScreenState createState() =>
      _AddNewCustomerProfileScreenState();
}

class _AddNewCustomerProfileScreenState
    extends State<AddNewCustomerProfileScreen> {
  final _nameController = TextEditingController();
  final _lNameController = TextEditingController();
  final _fNameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _tempAddController = TextEditingController();
  final _permanentAddController = TextEditingController();
  DateTime _selectedDOB = DateTime.now();
  late var selectGender;
  final _formKey = GlobalKey<FormState>();
  List gender=["Male","Female","Other"];


  @override
  void dispose() {
    _nameController.dispose();
    _lNameController.dispose();
    _fNameController.dispose();
    _mobileController.dispose();
    _emailController.dispose();
    _tempAddController.dispose();
    _permanentAddController.dispose();
    super.dispose();
  }

 

  void apiCallForUserProfileCreate() {
    
  }



  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDOB,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (pickedDate != null && pickedDate != _selectedDOB)
      setState(() {
        _selectedDOB = pickedDate;
      });
  }

  var radioItem ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        primary: true,
        title: Text(
          "Profile Update",
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: ElevatedButton(
          onPressed: () {
            // if (_formKey.currentState!.validate()) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     const SnackBar(content: Text('Processing Data')),
            //   );
            // }
            NetworkCall().addNewCustomerApiCall();
          },
          child: const Text('Submit'),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter first name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name*',
                  ),
                  controller: _nameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter last name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Last Name*',
                  ),
                  controller: _lNameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter father name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Father Name*',
                  ),
                  controller: _fNameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RaisedButton(
                      onPressed: () => _selectDate(context),
                      child: Text('Select Date Of Birth'),
                    ),
                    Text(DateFormat.yMMMd().format(_selectedDOB), style: TextStyle(fontSize: 22,
                        color: Colors.black, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter mobile number';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Mobile Number*',
                  ),
                  controller: _mobileController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email ID*',
                  ),
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter temp add';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Temporary Address*',
                  ),
                  controller: _tempAddController,
                ),
              ),
              // Row(
              //   children: <Widget>[
              //     RadioListTile(
              //       groupValue: radioItem,
              //       title: Text('Male'),
              //       value: 'male',
              //       onChanged: (val) {
              //         setState(() {
              //           radioItem = val;
              //         });
              //       },
              //     ),
              //     RadioListTile(
              //       groupValue: radioItem,
              //       title: Text('Female'),
              //       value: 'female',
              //       onChanged: (val) {
              //         setState(() {
              //           radioItem = val;
              //         });
              //       },
              //     ),
              //     Text('$radioItem', style: TextStyle(fontSize: 23),)
              //   ],
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Permanent Address*',
                  ),
                  controller: _permanentAddController,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


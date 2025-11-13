import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Register(), // Your Register widget is set as the home screen
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: RequiredValidator(errorText: 'Enter your name'),
              ),
              const SizedBox(height: 12),

              // Mobile
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Mobile',
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Enter mobile number'),
                  PatternValidator(r'^[0-9]{10}$',
                      errorText: 'Enter valid 10-digit number'),
                ]),
              ),
              const SizedBox(height: 12),

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Enter email'),
                  EmailValidator(errorText: 'Enter valid email'),
                ]),
              ),
              const SizedBox(height: 20),

              // Register Button
              // Corrected and Modernized Register Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Registered Successfully!')),
                      );
                    }
                  },
                  // --- Correction starts here ---
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Use 'backgroundColor' (or 'primary' in older SDKs) for the button fill color
                    foregroundColor: Colors.white, // Use 'foregroundColor' for the text/icon color
                    textStyle: const TextStyle(fontSize: 20), // Move fontSize here
                  ),
                  child: const Text('Register'), // The text color is now set by 'foregroundColor'
                  // --- Correction ends here ---
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
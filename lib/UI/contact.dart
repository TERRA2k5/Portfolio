import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:email_validator/email_validator.dart';

class ContactMe extends StatefulWidget {
  const ContactMe({super.key});

  @override
  State<ContactMe> createState() => _ContactMeState();
}

class _ContactMeState extends State<ContactMe> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  Future<void> _sendMessage() async {
    final email = _emailController.text.trim();
    final message = _messageController.text.trim();

    if (email.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in both fields.')),
      );
      return;
    }

    if( !EmailValidator.validate(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'aryananand005@gmail.com',
      queryParameters: {
        'subject': 'Contact from $email',
        'body': message,
      },
    );

    await launchUrl(emailUri).then((success) {
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Could not open email app.')),
        );
      }
    }).catchError((error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    });


    _emailController.clear();
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.all(16), child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 24, bottom: 16),
                child: Align(
                  alignment: Alignment.centerLeft, // Aligns text to the left
                  child: Text(
                    "Contact Me",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30,),
              TextField(
                controller: _emailController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Sender\'s Address',
                  labelStyle: const TextStyle(color: Colors.white70),
                  alignLabelWithHint: true,
                  filled: true,
                  fillColor: Colors.grey[850],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 40),
              TextField(
                controller: _messageController,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Your Message',
                  alignLabelWithHint: true,
                  labelStyle: const TextStyle(color: Colors.white70),
                  filled: true,
                  fillColor: Colors.grey[850],
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                maxLines: 6,
                keyboardType: TextInputType.multiline,
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  onPressed: _sendMessage,
                  icon: const Icon(Icons.send, color: Colors.black),
                  label: const Text(
                      "Send", style: TextStyle(color: Colors.black)),
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                ),
              ),
            ],
          ),),
        )
    );
  }
}

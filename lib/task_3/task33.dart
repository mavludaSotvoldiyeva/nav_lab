import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String phone;
  final String email;

  Contact({required this.name, required this.phone, required this.email});
}

void main() => runApp(const MaterialApp(home: Task33Screen1()));

class Task33Screen1 extends StatelessWidget {
  const Task33Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Contact> contacts = [
      Contact(name: 'Alice Johnson', phone: '123-456-7890', email: 'alice@example.com'),
      Contact(name: 'Bob Smith', phone: '234-567-8901', email: 'bob@example.com'),
      Contact(name: 'Charlie Brown', phone: '345-678-9012', email: 'charlie@example.com'),
      Contact(name: 'Diana Prince', phone: '456-789-0123', email: 'diana@example.com'),
      Contact(name: 'Evan Wright', phone: '567-890-1234', email: 'evan@example.com'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Task 3.3: Contacts')),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            title: Text(contact.name),
            subtitle: Text(contact.phone),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ContactScreen(contact: contact),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ContactScreen extends StatelessWidget {
  final Contact contact;
  const ContactScreen({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(contact.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${contact.name}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Phone: ${contact.phone}', style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 8),
                Text('Email: ${contact.email}', style: const TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
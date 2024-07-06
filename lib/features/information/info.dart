import 'chat.dart';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';
import 'detail.dart'; // Import the DetailPage
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  Widget _buildBox(BuildContext context, String input, String localizedInput) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(disorderKey: input),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(170, 93, 78, 63),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              'images/$input.png',
              fit: BoxFit.cover,
            ),
            Text(
              localizedInput,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffF5EBE0),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.informationTitle),
          backgroundColor: Color(0xffD6CCC2),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 2),
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 20.0,
          children: [
            // _buildChat(context),
            _buildBox(context, 'Depression',
                AppLocalizations.of(context)!.depression),
            _buildBox(
                context, 'Bipolar', AppLocalizations.of(context)!.bipolar),
            _buildBox(
                context, 'Anxiety', AppLocalizations.of(context)!.anxiety),
            _buildBox(context, 'PTSD', AppLocalizations.of(context)!.ptsd),
            _buildBox(context, 'Delusional',
                AppLocalizations.of(context)!.delusional),
            _buildBox(context, 'Schizophrenia',
                AppLocalizations.of(context)!.schizophrenia),
          ],
        ),
        
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Define navigation behavior
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChatPage(), // Adjust this as needed
              ),
            );
          },
          icon: Icon(Icons.chat), // Icon inside FAB
          label: Text(AppLocalizations.of(context)!.chatBot),
          backgroundColor: theme().primaryColor, // Adjust color as needed
          foregroundColor: Color.fromARGB(170, 93, 78, 63),
        ),

      
      ),
    );
  }
}

import 'package:cc_diary/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffF5EBE0),
        appBar: AppBar(
          title: Text(l10n(context).myDiaryPageTitle),
          backgroundColor: Color(0xffD6CCC2),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 1),
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 20.0,
          children: [
            _buildBox(context, 'Depression', l10n(context).depression),
            _buildBox(context, 'Bipolar', l10n(context).bipolar),
            // _buildBox('Depression'),
            // _buildBox('Bipolar'),
            // _buildBox('Depression'),
            // _buildBox('Bipolar'),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, String input, String localizedInput) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(170, 93, 78, 63),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/$input.png',
            fit: BoxFit.cover, // This can be changed to fit your design needs
          ),
          Text(
            localizedInput,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

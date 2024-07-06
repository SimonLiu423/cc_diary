import 'package:flutter/material.dart';
import 'detail.dart';  // Import the DetailPage
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
          title: Text(AppLocalizations.of(context)!.myDiaryPageTitle),
          backgroundColor: Color(0xffD6CCC2),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: (2 / 1),
          padding: const EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 20.0,
          children: [
            _buildBox(context, 'Depression', AppLocalizations.of(context)!.depression),
            _buildBox(context, 'Bipolar', AppLocalizations.of(context)!.bipolar),
          ],
        ),
      ),
    );
  }
}

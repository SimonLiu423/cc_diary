import 'dart:ffi';
import 'dart:developer';
import 'package:cc_diary/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailPage extends StatelessWidget {
  final String disorderKey;

  const DetailPage({Key? key, required this.disorderKey}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    log('disorderKey: $disorderKey');
    String getLocalizedText(String key) {
      switch (key) {
        case 'symptom':
          if (disorderKey == 'Depression') {
            return loc.depressionSymptom;
          } else if (disorderKey == 'Bipolar') {
            return loc.bipolarSymptom;
          } else if (disorderKey == 'Anxiety') {
            return loc.anxietySymptom;
          } else if (disorderKey == 'Schizophrenia') {
            return loc.schizophreniaSymptom;
          } else if (disorderKey == 'Delusional') {
            return loc.delusionalSymptom;
          } else if (disorderKey == 'PTSD') {
            return loc.ptsdSymptom;
          }
          return 'No information available';
        case 'explanation':
          if (disorderKey == 'Depression') {
            return loc.depressionExplanation;
          } else if (disorderKey == 'Bipolar') {
            return loc.bipolarExplanation;
          } else if (disorderKey == 'Anxiety') {
            return loc.anxietyExplanation;
          } else if (disorderKey == 'Schizophrenia') {
            return loc.schizophreniaExplanation;
          } else if (disorderKey == 'Delusional') {
            return loc.delusionalExplanation;
          } else if (disorderKey == 'PTSD') {
            return loc.ptsdExplanation;
          }
          return 'No information available';
        case 'groups':
          if (disorderKey == 'Depression') {
            return loc.depressionGroups;
          } else if (disorderKey == 'Bipolar') {
            return loc.bipolarGroups;
          } else if (disorderKey == 'Anxiety') {
            return loc.anxietyGroups;
          } else if (disorderKey == 'Schizophrenia') {
            return loc.schizophreniaGroups;
          } else if (disorderKey == 'Delusional') {
            return loc.delusionalGroups;
          } else if (disorderKey == 'PTSD') {
            return loc.ptsdGroups;
          }
          return 'No information available';
        default:
          return 'No information available';
      }
    }

    return Scaffold(
      backgroundColor: theme().primaryColor,
      appBar: AppBar(
        title: Text(loc
            .informationTitle), // Assuming title is generic or passed dynamically
        backgroundColor: Color(0xffD6CCC2),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          Text(
            loc.symptom,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            getLocalizedText('symptom'),
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          Text(
            loc.explanation,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            getLocalizedText('explanation'),
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 20),
          Text(
            loc.groups,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            getLocalizedText('groups'),
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.normal,
            ),
          ),
          Text(
            '\n' + loc.suggestion,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

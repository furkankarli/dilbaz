import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: const Translate(title: 'Çeviri'),
    );
  }
}

class Translate extends StatefulWidget {
  const Translate({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  String? _translatedText;
  String? _sourceLanguage;
  String? _targetLanguage;

  final List<String> _languages = ['en', 'es', 'fr', 'de', 'it', 'pt', 'tr'];

  Future<void> _translateText() async {
    final response = await http.post(
      Uri.parse('https://api-free.deepl.com/v2/translate'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        'auth_key': '7395efeb-9cce-4367-9bac-e9450d3727b9:fx',
        'text': _translatedText ?? '',
        'source_lang': _sourceLanguage ?? '',
        'target_lang': _targetLanguage ?? '',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      setState(() {
        _translatedText = jsonResponse['translations'][0]['text'];
      });
    } else {
      throw Exception('Çeviri yüklenemedi.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // ignore: avoid_unnecessary_containers
        body: Container(
          alignment: Alignment.center,
          child: SizedBox(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      labelText: 'Metin Dili',
                    ),
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    items: _languages.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value == 'en'
                              ? 'İngilizce'
                              : value == 'es'
                                  ? 'İspanyolca'
                                  : value == 'fr'
                                      ? 'Fransızca'
                                      : value == 'de'
                                          ? 'Almanca'
                                          : value == 'it'
                                              ? 'İtalyanca'
                                              : value == 'pt'
                                                  ? 'Portekizce'
                                                  : 'Türkçe',
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _sourceLanguage = value;
                      });
                    },
                    value: _sourceLanguage,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: TextField(
                    maxLines: 10,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      labelText: 'Metin',
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _translatedText = value;
                      });
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(color: Colors.black87),
                      ),
                      labelText: 'Çeviri Dili',
                    ),
                    style: const TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                    items: _languages.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value == 'en'
                              ? 'İngilizce'
                              : value == 'es'
                                  ? 'İspanyolca'
                                  : value == 'fr'
                                      ? 'Fransızca'
                                      : value == 'de'
                                          ? 'Almanca'
                                          : value == 'it'
                                              ? 'İtalyanca'
                                              : value == 'pt'
                                                  ? 'Portekizce'
                                                  : 'Türkçe',
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        _targetLanguage = value;
                      });
                    },
                    value: _targetLanguage,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  width: 350,
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black45),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: SingleChildScrollView(
                      child: Text(_translatedText ?? ''),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: ElevatedButton(
                      onPressed: _translateText,
                      // ignore: sort_child_properties_last
                      child: const Text('Çevir'),
                      style: ElevatedButton.styleFrom(
                        // ignore: deprecated_member_use
                        foregroundColor: Colors.white,
                        primary: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

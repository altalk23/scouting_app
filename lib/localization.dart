import 'dart:collection';

String a = "te";

HashMap<String, HashMap<String, String>> local = HashMap<String, HashMap<String, String>>.from({
    'Start the timer': HashMap<String, String>.from({
        'tr': 'Sayacı başlat',
    }),
    'End the timer': HashMap<String, String>.from({
        'tr': 'Sayacı bitir',
    }),
    'Team Number': HashMap<String, String>.from({
        'tr': 'Takım numarası',
    }),
});

extension LangParsing on String {
    String lang(String language) {
        if (language == Language.en) return this;
        return local[this][language];
    }
}

class Language {
    static const String en = 'en';
    static const String tr = 'tr';
}
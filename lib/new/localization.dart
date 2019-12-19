Map<String, Map<String, String>> local = {
    'Start the timer': {
        'en': 'Start the timer',
        'tr': 'Sayacı başlat',
    },
    'End the timer': {
        'en': 'Start the timer',
        'tr': 'Sayacı bitir',
    },
};

extension NumberParsing on String {
    String lang(String language) {
        return local[this][language];
    }
}

class Language {
    static const String en = 'en';
    static const String tr = 'tr';
}
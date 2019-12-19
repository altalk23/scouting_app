Map<String, Map<String, String>> local = {
    'Start the timer': {
        'tr': 'Sayacı başlat',
    },
    'End the timer': {
        'tr': 'Sayacı bitir',
    },
    'Team Number': {
        'tr': 'Takım numarası',
    },
};

extension NumberParsing on String {
    String lang(String language) {
        if (language == Language.en) return this;
        return local[this][language];
    }
}

class Language {
    static const String en = 'en';
    static const String tr = 'tr';
}
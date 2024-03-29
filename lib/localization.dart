import 'dart:collection';


HashMap<String, HashMap<String, String>> local = HashMap<String, HashMap<String, String>>.from({
    'Team': HashMap<String, String>.from({
        'tr': 'Takım',
    }),
    'English': HashMap<String, String>.from({
        'tr': 'İngilizce',
    }),
    'Turkish': HashMap<String, String>.from({
        'tr': 'Türkçe',
    }),
    'Start the timer': HashMap<String, String>.from({
        'tr': 'Sayacı başlat',
    }),
    'End the timer': HashMap<String, String>.from({
        'tr': 'Sayacı bitir',
    }),
    'Team Number': HashMap<String, String>.from({
        'tr': 'Takım numarası',
    }),
    'Driver Station Color': HashMap<String, String>.from({
        'tr': 'Sürücü İstasyonu Rengi',
    }),
    'Driver Station Alignment': HashMap<String, String>.from({
        'tr': 'Sürücü İstasyonu Hizası',
    }),
    'Left': HashMap<String, String>.from({
        'tr': 'Sol',
    }),
    'Middle': HashMap<String, String>.from({
        'tr': 'Orta',
    }),
    'Right': HashMap<String, String>.from({
        'tr': 'Sağ',
    }),
    'Cargo Placement': HashMap<String, String>.from({
        'tr': 'Kargo Alımı',
    }),
    'Take cargo': HashMap<String, String>.from({
        'tr': 'Kargo al',
    }),
    'Place cargo': HashMap<String, String>.from({
        'tr': 'Kargo bırak',
    }),
    'Hatch Placement': HashMap<String, String>.from({
        'tr': 'Kapak alımı',
    }),
    'Take hatch': HashMap<String, String>.from({
        'tr': 'Kapak al',
    }),
    'Place hatch': HashMap<String, String>.from({
        'tr': 'Kapak bırak',
    }),
    'Hab Climb Time': HashMap<String, String>.from({
        'tr': 'Hab tırmanma süresi',
    }),
    'Start the counter': HashMap<String, String>.from({
        'tr': 'Sayacı başlat',
    }),
    'End the counter': HashMap<String, String>.from({
        'tr': 'Sayacı bitir',
    }),
    'Hab Start Level': HashMap<String, String>.from({
        'tr': 'Hab Başlangıç Bölümü',
    }),
    'Hab End Level': HashMap<String, String>.from({
        'tr': 'Hab Bitiş Bölümü',
    }),
    'Robot Count': HashMap<String, String>.from({
        'tr': 'Robot Miktarı',
    }),
    'Robot Type': HashMap<String, String>.from({
        'tr': 'Robot Türü',
    }),
    'Teleop': HashMap<String, String>.from({
        'tr': 'Teleop',
    }),
    'Autonomous': HashMap<String, String>.from({
        'tr': 'Otonom',
    }),
    'Mixed': HashMap<String, String>.from({
        'tr': 'Karışık',
    }),
    'Autonomous Starts With': HashMap<String, String>.from({
        'tr': 'Otonom Neyle Başlıyor',
    }),
    'Cargo': HashMap<String, String>.from({
        'tr': 'Kargo',
    }),
    'Hatch': HashMap<String, String>.from({
        'tr': 'Kapak',
    }),
    'Crossing The Line': HashMap<String, String>.from({
        'tr': 'Çizgiyi Geçiyor Mu',
    }),
    'Defense Notes': HashMap<String, String>.from({
        'tr': 'Defans Notları',
    }),
    'Notes': HashMap<String, String>.from({
        'tr': 'Notlar',
    }),
    'Main Screen': HashMap<String, String>.from({
        'tr': 'Ana Ekran',
    }),
    'Input Screen': HashMap<String, String>.from({
        'tr': 'Giriş Ekranı',
    }),
    'QR Screen': HashMap<String, String>.from({
        'tr': 'QR Ekranı',
    }),
    'Red': HashMap<String, String>.from({
        'tr': 'Kırmızı',
    }),
    'Blue': HashMap<String, String>.from({
        'tr': 'Mavi',
    }),
    '%counter': HashMap<String, String>.from({
        'tr': '%counter',
    }),
});

extension LangParsing on String {
    String lang(String language) {
        if (language == Language.en) return this;
        if (this == null) return '';
        if (this.length < 2) return this;
        return local[this][language];
    }
}

class Language {
    static const String en = 'en';
    static const String tr = 'tr';
}
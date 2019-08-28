class AppLocalization {
    
    final String locale;
    
    AppLocalization(this.locale);
    
    static Map<String, Map<String, String>> _values = {
        'en': {
            'title': 'Hello World',
            'stopwatch_start': 'Start the timer',
            'stopwatch_end': 'End the timer'
        },
        'tr': {
            'title': 'Merhaba Dünya',
        },
    };
    
    static String title = _values[locale]['title'];
}


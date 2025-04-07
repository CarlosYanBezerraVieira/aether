class FormatTemperature {
  static int formatTemperatureInCelsius(double kelvinTemperature) {
    // 1. Converter a temperatura de Kelvin para Celsius
    double celsiusTemperature = kelvinTemperature - 273.15;

    // 2. Formatar a temperatura em Celsius arredondando para o número inteiro mais próximo
    int formattedTemperature = celsiusTemperature.round();

    return formattedTemperature;
  }

    static String formatTemperatureInCelsiusWithString(double kelvinTemperature) {
    // 1. Converter a temperatura de Kelvin para Celsius
    double celsiusTemperature = kelvinTemperature - 273.15;

    // 2. Formatar a temperatura em Celsius arredondando para o número inteiro mais próximo
    String formattedTemperature = celsiusTemperature.round().toString();

    return '$formattedTemperature°';
  }
}

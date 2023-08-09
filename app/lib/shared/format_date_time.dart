class DateFormateAppDefault{

  String formatDateTime(String dateTimeString) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    String formattedDate = "Dia ${dateTime.day.toString().padLeft(2, '0')}";
    String formattedTime = "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}";
    return "$formattedDate às $formattedTime";
  }

  String formatDateToday(DateTime data) {
    String ano = data.year.toString();
    String mes = data.month.toString().padLeft(2, '0');
    String dia = data.day.toString().padLeft(2, '0');
    return '$ano-$mes-$dia';
  }

}


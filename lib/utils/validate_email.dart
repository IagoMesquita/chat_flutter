String? validarEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, insira seu e-mail.';
  }
  // Regex para validar o formato do e-mail
  final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
  if (!emailRegex.hasMatch(value)) {
    return 'Por favor, insira um e-mail válido.';
  }
  return null; // Retorna null se o e-mail for válido
}

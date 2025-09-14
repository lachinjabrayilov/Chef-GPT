import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config.dart';
class OllamaService {
  final String baseUrl;

  OllamaService({this.baseUrl = '$serverIp:11434'});

  Future<String?> generate({
    required String prompt,
    String model = 'mistral',
    bool stream = false,
  }) async {
    final url = Uri.parse('http://$baseUrl/api/generate');
    final body = jsonEncode({
      'model': model,
      'prompt': prompt,
      'stream': stream,
    });

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['response'] as String? ?? data.toString();
      } else {
        return 'Hata (HTTP ${response.statusCode}): ${response.body}';
      }
    } catch (e) {
      return 'Bağlantı hatası: $e';
    }
  }
}
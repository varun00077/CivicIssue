import 'dart:convert';
import 'package:http/http.dart' as http;

class GroqService {
  final String apiKey = "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"; // Replace with your Groq key
  final String apiUrl = "https://api.groq.com/openai/v1/chat/completions";

  Future<String> getChatResponse(String message) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $apiKey",
      },
      body: jsonEncode({
        "model": "llama-3.1-8b-instant",
        "messages": [
          {"role": "system", "content": "You are a helpful assistant."},
          {"role": "user", "content": message},
        ],
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['choices'][0]['message']['content'];
    } else {
      throw Exception("Groq API Error: ${response.body}");
    }
  }
}

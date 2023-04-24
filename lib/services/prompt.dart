import 'dart:convert';
import 'package:http/http.dart' as http;


Future<String> generatePrompt(String prompt) async {
  final String apiKey = '<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>';
  final String endpoint = 'https://api.openai.com/v1/engines/davinci-codex/completions';
  final prompt = 'Give me a topic to talk about with my friends';

  
  final data = {
    'prompt': prompt,
    'max_tokens': 50,
    'n': 1,
    'stop': '\n',
  };

  final response = await http.post(Uri.parse(endpoint), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  }, body: jsonEncode({
    data,
    // 'prompt': prompt,
    // 'max_tokens': 100,
    // 'temperature': 0.5,
    // 'n': 1,
    // 'stop': ['\n']
    
  }
  ));
  print(response.body);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final text = data['choices'][0]['text'];
    return text;
  } else {
    throw Exception('Failed to generate prompt.');
  }
}

// Future<void> sendPostRequest() async {
//   final url = 'https://api.openai.com/v1/engines/davinci-codex/completions';
//   final apiKey = 'YOUR_API_KEY';
//   final prompt = 'Write a Flutter app to';
//   final headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer $apiKey',
//   };
//   final data = {
//     'prompt': prompt,
//     'max_tokens': 50,
//     'n': 1,
//     'stop': '\n',
//   };
//   final response = await http.post(Uri.parse(url), headers: headers, body: jsonEncode(data));
//   print(response.body);
// }
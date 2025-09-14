import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/ollama_service.dart';
import '../widgets/ingredient_input.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OllamaService _ollamaService = OllamaService();
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Map<String, String>> _messages = []; // {'role': 'user'|'ai', 'text': '...'}
  bool _loading = false;

  Future<void> _sendPrompt() async {
    final prompt = _controller.text.trim();
    if (prompt.isEmpty) return;

    setState(() {
      _messages.add({'role': 'user', 'text': prompt});
      _loading = true;
      _controller.clear();
    });

    final fullPrompt =
        'Sadece Türkçe cevap ver. Kullanıcı ne yazarsa yazsın, tarifleri Türkçe yaz. Şu malzemelerle yemek öner: $prompt';
    final answer = await _ollamaService.generate(prompt: fullPrompt);

    setState(() {
      _messages.add({'role': 'ai', 'text': answer ?? 'Cevap alınamadı.'});
      _loading = false;
    });

    // Otomatik en alta kaydır
    Future.delayed(const Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });

    // Ses efekti (basit sistem sesi)
    SystemSound.play(SystemSoundType.click);
  }

  void _onIngredientChange(List<String> ingredients) {
    final joined = ingredients.join(', ');
    _controller.text = joined;
  }

  Widget _buildMessage(Map<String, String> message) {
    final isUser = message['role'] == 'user';
    final alignment = isUser ? Alignment.centerRight : Alignment.centerLeft;
    final bgColor = isUser ? Colors.blue[100] : Colors.grey[200];
    final textColor = Colors.black;

    return Align(
      alignment: alignment,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        constraints: const BoxConstraints(maxWidth: 300),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(message['text']!, style: TextStyle(color: textColor)),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chef GPT 🍳')),
      body: Column(
        children: [
          // 🥗 Malzeme Girişi
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: IngredientInput(onChanged: _onIngredientChange),
          ),

          const Divider(height: 1),

          // 🧠 Mesaj Geçmişi
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),

          // ⏳ Yükleniyorsa animasyon
          if (_loading)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: CircularProgressIndicator(),
            ),

          const Divider(height: 1),

          // 💬 Prompt Girişi Sabit Altta
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: const InputDecoration(
                        hintText: 'Malzemeleri yaz...',
                        border: OutlineInputBorder(),
                      ),
                      onSubmitted: (_) => _sendPrompt(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: _loading ? null : _sendPrompt,
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

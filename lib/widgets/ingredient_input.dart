import 'package:flutter/material.dart';

class IngredientInput extends StatefulWidget {
  final void Function(List<String>) onChanged;
  const IngredientInput({Key? key, required this.onChanged}) : super(key: key);

  @override
  State<IngredientInput> createState() => _IngredientInputState();
}

class _IngredientInputState extends State<IngredientInput> with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();
  List<String> ingredients = [];
  bool _showHint = false;

  void _addIngredient() {
    final text = _controller.text.trim();
    if (text.isNotEmpty && !ingredients.contains(text)) {
      setState(() {
        ingredients.add(text);
        _controller.clear();
        _showHint = true;
        widget.onChanged(ingredients);
      });

      // "Hmm..." balonunu otomatik gizle
      Future.delayed(const Duration(seconds: 2), () {
        if (mounted) {
          setState(() {
            _showHint = false;
          });
        }
      });
    }
  }

  void _removeIngredient(String ingredient) {
    setState(() {
      ingredients.remove(ingredient);
      widget.onChanged(ingredients);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Malzeme ekle',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addIngredient,
                ),
              ),
              onSubmitted: (_) => _addIngredient(),
            ),
            // Baloncuk mesaj
            if (_showHint)
              Positioned(
                top: -40,
                left: 10,
                child: Material(
                  elevation: 2,
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.orange.shade100,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    child: Text(
                      'Hmm... Lezzetli seçimler!',
                      style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: ingredients.map((ingredient) {
            return Chip(
              label: Text(ingredient),
              onDeleted: () => _removeIngredient(ingredient),
            );
          }).toList(),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_recommendation_chatbot/cubit/movie_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _diaryController = TextEditingController();

  @override
  void dispose() {
    _diaryController.dispose(); // Dispose controller to prevent memory leaks
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _diaryController,
              decoration: const InputDecoration(
                labelText: 'Enter your diary entry',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final diaryEntry = _diaryController.text;
                if (diaryEntry.isNotEmpty) {
                  context.read<MovieCubit>().getMovieRecommendation(diaryEntry);
                }
              },
              child: const Text('Get Movie Recommendation'),
            ),
            const SizedBox(height: 20),
            Expanded(
              // Ensure this is the only widget using Expanded in the Column
              child: SingleChildScrollView(
                child: BlocBuilder<MovieCubit, MovieState>(
                  builder: (context, state) {
                    if (state is MovieLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is MovieLoaded) {
                      return Text('Recommended Movie: ${state.recommendation}');
                    } else if (state is MovieError) {
                      return Text('Error: ${state.message}',
                          style: const TextStyle(color: Colors.red));
                    }
                    return const Center(
                        child:
                            Text('Enter a diary entry to get recommendations'));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

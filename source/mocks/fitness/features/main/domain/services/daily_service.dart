import 'package:fitness_app/features/main/domain/domain.dart';

class DailyService implements DailyRepository {
  @override
  Future<List<DailyProgram>?> getProgram(String token) async {
    return [
      DailyProgram(
        title: "Monday",
        subtitle: "Full body",
        comments: 5,
        blocs: [
          EMOM(
            workMinutes: 2,
            capMinutes: 10,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "Power Clean x1"),
              Exercise(name: "Clean x1"),
              Exercise(name: "Power Squat Clean x1"),
              Exercise(name: "Pause Squat x1"),
              Exercise(name: "High Jump Squat x3"),
            ],
          ),
          EMOM(
            workMinutes: 2,
            capMinutes: 12,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "*0-2': Squat Clean x8"),
              Exercise(name: "*2-4': Lunges x8/side"),
              Exercise(name: "*4-6': Romanian Deadlift x10 + Jump Squat x10 + Cruches x10"),
            ],
          ),
          Tabata(
            sets: 3,
            pauseMinutes: 1,
            workSeconds: 20,
            restSeconds: 10,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: 'Burpees x30'),
              Exercise(name: 'Goblet Squat Clean x30'),
              Exercise(name: 'Rack Walk x30'),
              Exercise(name: 'Swings x30'),
              Exercise(name: 'Jumping Jacks x30'),
              Exercise(name: 'Farmer Walk x30'),
            ],
          ),
        ],
      ),
      DailyProgram(title: "Tuesday", subtitle: "Rest", text: "Find your workouts in video every week!", comments: 0),
      DailyProgram(
        title: "Wednesday",
        subtitle: "Full Body",
        comments: 0,
        blocs: [
          AMRAP(
            sets: 3,
            capMinutes: 2,
            restMinutes: 1,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [Exercise(name: "Over Head Press x5/side"), Exercise(name: "Sumo Rowing x5/side")],
          ),
          ForTime(
            capMinutes: 15,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "Pull-ups x50"),
              Exercise(name: "Weighted Inclised Push-ups x50"),
              Exercise(name: "American Swings x50"),
            ],
          ),
        ],
      ),
      DailyProgram(title: "Thursday", subtitle: "Rest", text: "Find your workouts in video every week!", comments: 0),
      DailyProgram(
        title: "Friday",
        subtitle: "Full Body",
        comments: 0,
        blocs: [
          EMOM(
            workMinutes: 2,
            workSeconds: 30,
            capMinutes: 10,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "Over Head Press x6"),
              Exercise(name: "Weighted Pull-ups x6"),
              Exercise(name: "Toes to Bar x6"),
            ],
          ),
          EMOM(
            workMinutes: 2,
            workSeconds: 30,
            capMinutes: 10,
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "Floor Press x8"),
              Exercise(name: "Sumo Rowing x8"),
              Exercise(name: "Knee Raises x8"),
            ],
          ),
          ForTime(
            videoAsset: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
            exercises: [
              Exercise(name: "Rear Delt Fly x30"),
              Exercise(name: "Upright Rows x30"),
              Exercise(name: "Burpees x30"),
              Exercise(name: "Swings x30"),
              Exercise(name: "Jumping Jacks x30"),
              Exercise(name: "Farmer Walk x30"),
            ],
          ),
        ],
      ),
    ];
  }
}

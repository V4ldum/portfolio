import '../domain.dart';

class CommentsService implements CommentsRepository {
  @override
  Future<List<Comment>?> getComments(String token, int day) async {
    if (token != "123" || day != 0) {
      return [];
    }
    return [
      Comment(
        id: 1,
        username: "cat_bumstead",
        userDisplayName: "Cat Bumstead",
        message: "Today's workout was pretty hard",
        timestamp: DateTime(2022, 01, 17, 18, 35).millisecondsSinceEpoch ~/ 1000,
        nbReplies: 1,
      ),
      Comment(
        id: 2,
        username: "mock",
        userDisplayName: "Mock User",
        message: "Cool workout !",
        timestamp: DateTime(2022, 01, 17, 17, 55).millisecondsSinceEpoch ~/ 1000,
        nbReplies: 0,
      ),
    ];
  }

  @override
  Future<Comment?> getComment(String token, int commentId) async {
    if (token != "123") {
      return null;
    }
    if (commentId == 1) {
      return Comment(
        id: 1,
        username: "cat_bumstead",
        userDisplayName: "Cat Bumstead",
        message: "Today's workout was pretty hard",
        timestamp: DateTime(2022, 01, 17, 18, 35).millisecondsSinceEpoch ~/ 1000,
        nbReplies: 1,
      );
    }
    if (commentId == 2) {
      return Comment(
        id: 2,
        username: "mock",
        userDisplayName: "Mock User",
        message: "Cool workout !",
        timestamp: DateTime(2022, 01, 17, 17, 55).millisecondsSinceEpoch ~/ 1000,
        nbReplies: 0,
      );
    }
    return null;
  }

  @override
  Future<List<Reply>?> getReplies(String token, int commentId) async {
    if (token != "123" || commentId != 1) {
      return null;
    }
    return [
      Reply(
        username: "mock",
        userDisplayName: "Mock User",
        message: "That's true",
        timestamp: DateTime(2022, 01, 17, 18, 50).millisecondsSinceEpoch ~/ 1000,
      ),
    ];
  }
}

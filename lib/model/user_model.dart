class UserData {
    UserData({
        required this.userId,
        required this.id,
        required this.title,
        required this.completed,
    });

    final int? userId;
    final int? id;
    final String? title;
    final bool? completed;

    factory UserData.fromJson(Map<String, dynamic> json){ 
        return UserData(
            userId: json["userId"],
            id: json["id"],
            title: json["title"],
            completed: json["completed"],
        );
    }

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "completed": completed,
    };

}

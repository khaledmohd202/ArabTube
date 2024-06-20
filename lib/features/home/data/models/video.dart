class VideoModel {
  String? id;
  String? title;
  int? likes;
  int? disLikes;
  int? views;
  String? channelTitle;
  String? userId;
  String? username;
  String? createdOn;
  String? thumbnail;
  String? profilePic;


  VideoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    likes = json['likes'];
    disLikes = json['disLikes'];
    views = json['views'];
    channelTitle = json['channelTitle'];
    userId = json['userId'];
    username = json['username'];
    createdOn = json['createdOn'];
    thumbnail = json['thumbnail'];
    profilePic = json['profilePic'];
  }

}
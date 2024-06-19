class Video {
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

  Video({
    this.id,
    this.title,
    this.likes,
    this.disLikes,
    this.views,
    this.channelTitle,
    this.userId,
    this.username,
    this.createdOn,
    this.thumbnail,
  });

  Video.fromJson(Map<String, dynamic> json) {
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
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['likes'] = this.likes;
  //   data['disLikes'] = this.disLikes;
  //   data['views'] = this.views;
  //   data['channelTitle'] = this.channelTitle;
  //   data['userId'] = this.userId;
  //   data['username'] = this.username;
  //   data['createdOn'] = this.createdOn;
  //   data['thumbnail'] = this.thumbnail;
  //   return data;
  // }
}

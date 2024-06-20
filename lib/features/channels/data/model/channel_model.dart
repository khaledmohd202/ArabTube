class ChannelModel {
  String? channelTitle;
  String? username;
  String? userId;
  int? numOfVidoes;
  int? numOfSubscripers;
  String? profilePic;


  ChannelModel.fromJson(Map<String, dynamic> json) {
    channelTitle = json['channelTitle'];
    username = json['username'];
    userId = json['userId'];
    numOfVidoes = json['numOfVidoes'];
    numOfSubscripers = json['numOfSubscripers'];
    profilePic = json['profilePic'];
  }

}
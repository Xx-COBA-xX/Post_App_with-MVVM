import 'package:mvvm2/model/post_model.dart';

class PostViewModel {
  PostModel postModel;

  PostViewModel({required this.postModel});


  get id => postModel.id;
  get title => postModel.title;
  get body => postModel.body;
  get userId => postModel.userId;
}

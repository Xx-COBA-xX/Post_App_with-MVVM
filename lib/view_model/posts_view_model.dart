import 'package:mvvm2/model/post_model.dart';
import 'package:mvvm2/repo/post_repo.dart';
import 'package:mvvm2/view_model/post_view_model.dart';

class PostsViewModel {
  PostRepository repository;

  String title = "Posts App ";
  PostsViewModel( {required this.repository});

  Future<List<PostViewModel>> feshPost() async {
    List<PostModel> list = await repository.getAllPost();

    return list.map((e) => PostViewModel(postModel: e)).toList();
  }
}

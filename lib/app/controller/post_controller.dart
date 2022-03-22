import '../../core/base/controller_base.dart';
import '../model/post_model.dart';
import '../repository/post_repository.dart';

abstract class IPostController extends ControllerBase {
  List<PostModel>? listaPosts;
  bool isLoading = false;
  late IPostRepository repository;
  @override
  Future<void> buscaDados();
}

class PostController implements IPostController {
  @override
  List<PostModel>? listaPosts;

  @override
  IPostRepository repository = PostRepository();

  @override
  bool isLoading = false;

  @override
  Future<void> buscaDados() async {
    isLoading = true;
    listaPosts = [];
    await repository.getData().then((value) {
      listaPosts!.add(PostModel.fromMap(value.data()));
    });
    isLoading = false;
  }

  @override
  void resetaDados() {
    listaPosts = [];
  }
}

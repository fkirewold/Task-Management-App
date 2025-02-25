import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/models/blog_model.dart';
import 'package:todo/repositories/blog_repository.dart';

part 'blog_event.dart';
part 'blog_state.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  BlogBloc() : super(BlogInitial()) {
    on<FetchBlogs>(_onFetchBlog);
  }

  _onFetchBlog(FetchBlogs event, Emitter emit) async {
    try {
      emit(BlogLoading());
      final blogs = await BlogRepository().fetchPosts();
      emit(BlogSuccess(blogs: blogs));
    } catch (e) {
      emit(BlogError(reason: e.toString()));
    }
  }
}

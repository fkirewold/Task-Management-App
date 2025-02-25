part of 'blog_bloc.dart';

@immutable
sealed class BlogState {}

final class BlogInitial extends BlogState {}

final class BlogLoading extends BlogState {}

final class BlogError extends BlogState {
  final String reason;

  BlogError({required this.reason});
}

final class BlogSuccess extends BlogState {
  final List<BlogModel> blogs;

  BlogSuccess({required this.blogs});
}

part of 'blog_bloc.dart';

@immutable
sealed class BlogEvent {}

final class FetchBlogs extends BlogEvent {}

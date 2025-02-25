import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/presentation/widgets/text_widget.dart';

import '../../bloc/blog/blog_bloc.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
    context.read<BlogBloc>().add(FetchBlogs());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: TextWidget(
            text: 'My Blog',
            color: Colors.white,
            fontSize: 18,
          ),
          backgroundColor: Theme.of(context).primaryColor,
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          )),
      body: BlocConsumer<BlogBloc, BlogState>(listener: (context, state) {
        if (state is BlogError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.reason),
              duration: Duration(seconds: 3), // Display for 3 seconds
              action: SnackBarAction(
                label: 'OK',
                onPressed: () {
                  // Action to perform when the user presses the action button
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      }, builder: (context, state) {
        return state is BlogLoading
            ? Center(child: CircularProgressIndicator())
            : (state is BlogSuccess)
                ? ListView.builder(
                    itemCount: state.blogs.length,
                    itemBuilder: (context, index) {
                      final blog = state.blogs[index];
                      return Card(
                        elevation: 4,
                        margin:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.blue,
                            child: Text(
                              (index+1).toString(),
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          title: TextWidget(
                            text: blog.title,
                            fontSize: 16,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                blog.body,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 8),
                              ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => PostDetailScreen(post: post),
                                  //   ),
                                  // );
                                },
                                child: Text('View Details'),
                              ),
                            ],
                          ),
                        ),
                      );
                      // ListTile(
                      //   title: Text(blog.title),
                      //   subtitle: Text(blog.body),
                      // );
                    },
                  )
                : SizedBox();
      }),
    );
  }
}

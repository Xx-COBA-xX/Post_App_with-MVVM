
import 'package:flutter/material.dart';
import 'package:mvvm2/view_model/posts_view_model.dart';

import '../repo/post_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PostsViewModel postsViewModel = PostsViewModel(repository: PostApi());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(postsViewModel.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: postsViewModel.feshPost(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              var post = snapshot.data;
              return ListView.builder(
                itemCount: post?.length,
                itemBuilder: (ctx, index) {
                  return myCard(
                    body: post![index].body,
                    title: post[index].title,
                    userId: post[index].userId,
                  );
                },
              );
            }
          }),
        ),
      ),
    );
  }

  Card myCard({title, userId, body}) {
    return Card(
      margin: const EdgeInsets.all(20),
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              "User id : $userId",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(body, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}

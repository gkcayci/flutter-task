import 'package:flutter/material.dart';
import 'package:jobswire/color/color_theme.dart';
import 'package:jobswire/image/image.dart';
import 'package:jobswire/view_model/view_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JobSwire'),
        backgroundColor: ColorTheme().governorbay,
      ),
      body: ChangeNotifierProvider(
        create: (context) => JobModel(),
        child: Builder(builder: (context) {
          final model = Provider.of<JobModel>(context);

          if (model.homeState == HomeState.Loading) {
            return Center(child: CircularProgressIndicator());
          }
          if (model.homeState == HomeState.Error) {
            return Center(child: Text('An Error Occured ${model.message}'));
          }
          final jobs = model.jobs;
          return Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(children: [
                    Stack(
                      children: [
                        Ink.image(
                          image: NetworkImage(
                            ImageAssets.photo,
                          ),
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text(
                            'Remote Jobs',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: ColorTheme().white,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: jobs.length,
                      itemBuilder: (context, index) {
                        final job = jobs[index];
                        return ExpansionTile(
                          childrenPadding: EdgeInsets.all(16),
                          title: Text(
                            job.position,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          children: [
                            Text(
                              job.company,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              job.location,
                              style: TextStyle(fontSize: 14, height: 1.4),
                            ),
                            Text(
                              job.description,
                              style: TextStyle(fontSize: 14, height: 1.4),
                            ),
                          ],
                        );
                      },
                    ),
                  ])));
        }),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Cambiar por una instancia de movie
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          const _PosterAndTitle(),
          const _Overview(),
        ]))
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            color: Colors.black12,
            child: const Text(
              "movie.title",
              style: TextStyle(fontSize: 16),
            )),
        background: const FadeInImage(
          placeholder: AssetImage("assets/loading.gif"),
          image: NetworkImage("https://via.placeholder.com/500x300"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle();

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage("assets/no-image.jpg"),
              image: NetworkImage("https://via.placeholder.com/200x300"),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "movie.title",
                style: textTheme.headlineSmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                "movie.originalTitle",
                style: textTheme.titleMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.star_outline,
                    size: 15,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "movie.voteAverage",
                    style: textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Text("""

In aute officia cillum adipisicing proident. Ea nisi enim officia esse sunt dolore tempor sit id labore. Est proident et culpa ex ad esse officia.

Nulla excepteur quis magna nulla ad. Sunt ex aliqua aute deserunt labore dolor eu cillum enim. Id eu qui minim ea officia. Sint ad nostrud magna nostrud culpa irure minim. Culpa non labore in sunt ipsum id.

Cupidatat velit deserunt eu culpa excepteur officia minim exercitation eu quis. Consectetur excepteur aliqua deserunt nostrud fugiat quis do do deserunt ad fugiat sint. Quis dolore ullamco officia aliquip duis officia enim eiusmod non sunt pariatur proident adipisicing. Dolor eiusmod velit et aliquip in ea ut anim velit magna reprehenderit cillum qui. Ea Lorem ex incididunt do aute minim pariatur ut cillum. Deserunt aute deserunt veniam anim ex dolor. Culpa deserunt elit culpa reprehenderit duis.

Exercitation aliquip do et commodo nulla elit tempor. Amet ea qui elit ipsum culpa duis consequat Lorem adipisicing et nisi pariatur. Ut elit nulla cupidatat adipisicing. Qui reprehenderit aliqua incididunt aliquip ut officia consequat proident. Est et eiusmod cupidatat dolore consequat quis excepteur deserunt consectetur eiusmod. Aute qui quis ea esse cupidatat in sint enim dolor veniam consequat veniam commodo sit.

Cupidatat officia anim cupidatat occaecat magna qui ex commodo aliqua adipisicing dolore. Reprehenderit ea tempor consequat excepteur magna aute aliqua culpa dolore mollit nisi. Magna voluptate enim exercitation occaecat anim aute nostrud esse est dolore. Et irure adipisicing ea ipsum commodo. Et cillum mollit voluptate cupidatat esse.

In duis ex magna anim veniam sunt nisi et dolore nostrud veniam. Sunt anim magna dolore dolore adipisicing aliquip aute sunt. Quis fugiat ipsum dolore exercitation deserunt duis irure nisi minim sint consectetur excepteur in. Elit non occaecat et culpa quis. Ipsum irure irure labore aliquip elit exercitation laboris quis quis irure fugiat pariatur.

Irure aute cupidatat laboris ad veniam anim cillum est ut minim. Reprehenderit nisi cupidatat id deserunt dolor minim amet. Do proident pariatur occaecat duis. Nulla anim laboris cillum non ad proident sit dolor sint culpa quis duis et incididunt.

Occaecat culpa magna amet mollit proident pariatur elit et velit anim excepteur eiusmod incididunt aliqua. Ullamco excepteur proident pariatur amet Lorem do Lorem sunt. Eiusmod exercitation aliqua ullamco amet exercitation fugiat laborum id enim. Cupidatat cillum consequat tempor excepteur adipisicing id ipsum aliquip mollit deserunt.

Consequat eu nostrud minim do sit. Ipsum consequat deserunt aliquip amet velit do. Esse sint esse commodo irure eiusmod non. Enim veniam ut dolore proident.

Consequat elit non consectetur commodo deserunt duis deserunt excepteur nostrud labore ut ipsum. Do ad duis elit amet eiusmod velit duis ullamco minim dolor quis eiusmod laborum velit. Et ad cupidatat ullamco amet sint.

"""),
    );
  }
}

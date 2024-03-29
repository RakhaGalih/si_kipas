// ignore_for_file: public_member_api_docs, sort_constructors_first
class HomeCardModel {
  final String title;
  final String desc;
  final String image;
  final void Function() onTap;
  const HomeCardModel(
    this.title,
    this.desc,
    this.image,
    this.onTap,
  );
}

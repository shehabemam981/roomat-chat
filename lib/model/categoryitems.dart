class  categoryitem{
  static String sportid="sports";
  static String moviesid="movies";
  static String musicid="music";
   String catid;
  late String namecat;
  late String image;
  categoryitem(this.catid, this.namecat, this.image);
 categoryitem.fromId(this.catid){
   if(catid==sportid){
      namecat="sports";
      image="assets/images/sports.jpeg";
    }else if(catid==moviesid){
      namecat="movies";
      image="assets/images/movies.jpeg";
    }else if(catid==musicid){
      namecat="music";
      image="assets/images/music.jpeg";
    }
  }
 static List<categoryitem> categories(){
   return[
     categoryitem.fromId(sportid),
  categoryitem.fromId(moviesid),
  categoryitem.fromId(musicid),
  ];
}
}

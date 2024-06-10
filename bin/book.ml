type book = {
  name : string;
  pages : int option;
  chapters : int option;
  volumes : int option;
  volume_chapters : int option; (* How many chapters per volume *)
}

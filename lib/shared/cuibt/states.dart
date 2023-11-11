class news_state {}

class newsInitialState extends news_state {}

class changescreenSucess extends news_state {}

class changescreenErorr extends news_state {
  final String? errorscreen;
  changescreenErorr(this.errorscreen);
}

class businessInitialState extends news_state {}

class businessscreenSucess extends news_state {}

class businessscreenErorr extends news_state {
  final String? errorscreen;
  businessscreenErorr(this.errorscreen);
}

class emtertainmentInitialState extends news_state {}

class entertainmentscreenSucess extends news_state {}

class entertanmentscreenErorr extends news_state {
  final String? errorscreen;
  entertanmentscreenErorr(this.errorscreen);
}

class healthInitialState extends news_state {}

class healthscreenSucess extends news_state {}

class healthscreenErorr extends news_state {
  final String? errorscreen;
  healthscreenErorr(this.errorscreen);
}

class scienceInitialState extends news_state {}

class sciencescreenSucess extends news_state {}

class sciencescreenErorr extends news_state {
  final String? errorscreen;
  sciencescreenErorr(this.errorscreen);
}

class sportssInitialState extends news_state {}

class sportsscreenSucess extends news_state {}

class sportsscreenErorr extends news_state {
  final String? errorscreen;
  sportsscreenErorr(this.errorscreen);
}

class technologyInitialState extends news_state {}

class technologyscreenSucess extends news_state {}

class technologyscreenErorr extends news_state {
  final String? errorscreen;
  technologyscreenErorr(this.errorscreen);
}

class searchInitialState extends news_state {}

class searchscreenSucess extends news_state {}

class searchscreenErorr extends news_state {
  final String? errorscreen;
  searchscreenErorr(this.errorscreen);
}

class changemodescreenSucess extends news_state {}

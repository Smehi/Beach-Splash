/********************Player Collision********************/

//Controleer of er kruising is tussen de Player en de Platform
boolean intersect(Player s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }

  return false;// er vind geen kruising paats
}//End intersect tussen Player en Platform

//Controleer of er kruising is tussen de Player en de BulletBeachboy
boolean intersect(Player s1, BulletBeachboy s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/2 + s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen Player en BulletBeachboy


//Controleer of er kruising is tussen de Player en de HpDrop
boolean intersect(Player s1, HpDrop s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/2 + s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen Player en HpDrop

//Controleer of er kruising is tussen de Player en de AmmoDrop
boolean intersect(Player s1, AmmoDrop s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/4 + s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen Player en AmmoDrop

/********************Beachboy Collision********************/

//Controleer of er kruising is tussen de Beachboy en Beachboy
boolean intersect(Beachboy s1, Beachboy s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/2 + s2.w/2;
  //Wat is het totaal van beide hoogt helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;//Er vind geen kruising paats
}//End Intersect tussen Beachboy en Beachboy

//Controleer of er kruising is tussen de Beachboy en BulletPlayer
boolean intersect(Beachboy s1, BulletPlayer s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/2 + s2.w/2;
  //Wat is het totaal van beide hoogt helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;//Er vind geen kruising paats
}//End Intersect tussen Beachboy en BulletPlayer

//Controleer of er kruising is tussen de Beachboy en de Platform
boolean intersect(Beachboy s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s2.w/2;
  //Wat is het totaal van beide hoogt helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen Beachboy en Platform

/********************BulletPlayer Collision********************/

//Controleer of er kruising is tussen de BulletPlayer en de Platform
boolean intersect(BulletPlayer s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/4 + s2.w/2;
  //Wat is het totaal van beide hoogt helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen BulletPlayer en Platform

/********************BulletBeachboy Collision********************/

//Controleer of er kruising is tussen de BulletBeachboy en de Platform
boolean intersect(BulletBeachboy s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/4 + s2.w/2;
  //Wat is het totaal van beide hoogt helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen BulletBeachboy en Platform

/********************HpDrop Collision********************/

//Controleer of er kruising is tussen de HpDrop en de Platform
boolean intersect(HpDrop s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/4 + s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen HpDrop en Platform

/********************AmmoDrop Collision********************/

//Controleer of er kruising is tussen de AmmoDrop en de Platform
boolean intersect(AmmoDrop s1, Platform s2) {
  //Wat is het horizontale verschil
  //Het verschil word berekend vanaf het midden
  float distX = (s1.x + s1.w/2) - (s2.x + s2.w/2);
  //Wat is het verticale verschil
  //Het verschil word berekend vanaf het midden
  float distY = (s1.y + s1.h/2) - (s2.y + s2.h/2);

  //Wat is het totaal van beide breedte helften
  float comHalfW = s1.w/4 + s2.w/2;
  //Wat is het totaal van beide hoogte  helften
  float comHalfH = s1.h/2 + s2.h/2;

  //Controleer voor horizontale kruising
  if (abs(distX) < comHalfW) {
    //Controleer voor verticale kruising
    if (abs(distY) < comHalfH) {
      return true;//Er vind een kruising plaats
    }
  }
  return false;// er vind geen kruising paats
}//End intersect tussen AmmoDrop en Platform
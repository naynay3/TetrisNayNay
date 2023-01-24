//System objek sebagai T
system t;
//Nilai Boolean apakah pause dan start
boolean paused, start;
//Deklarasi down sebagai PVector
PVector down;
//deklarasai next
int next;

void settings(){
  //Ukuran Layar
  size(400, 600);
}

void setup(){
  //Ukuran text
  textSize(20);
  //Lakukan random
  next = int(random(7));
  t = new system(); //Deklarasi Objek
  down = new PVector(0, 1); // variabel down
}

void draw(){
  translate(0, -3 * t.res);
  background(0);
  //Jika tidak mulai
  if(!start){
    //Jikaa tombol di klik maka mulai 
    if(keyPressed) start = true;
  }
  else{
    //Kalau mulai, maka buat grid dari res di Syste,
    grid(t.res);
    t.run();//Run
  }
  hud(); 
}

//Fungsi pada keyboard
void keyPressed(){
  //Jika kode adalah A bergerak ke kiri
  if(keyCode == 'A') t.move(false);
  //D bergerak ke kanan
  else if(keyCode == 'D') t.move(true);
  //W rotasi kanan
  else if(keyCode == 'W') t.rotate(true);
  //Q Rotasi kiri
  else if(keyCode == 'Q') t.rotate(false);
  //S untuk turunkan objek
  else if(keyCode == 'S' && t.b.position.y > t.res * 4) t.b.v.add(down);
  //P Untuk pause atau memulai kembaali
  else if(keyCode == 'P' && start && !t.over) paused = !paused;
}

//Fungsi grid dengan parameter res
void grid(int res){
  stroke(10);//Buat stroke 10
  //Nested Loop untuk membuaat rectangle
  for(int x = 0; x <= width - t.res; x += res){
    for(int y = 0; y <= height - t.res; y += res){
      if(t.grid[y/t.res][x/t.res] == 1) fill(255);
      else fill(0);
      rect(x, y, res, res);
    }
  }
}
//Fungsi hud
void hud(){
  fill(10);
  stroke(10);
  if(start) rect(0, height, width, 60);

  stroke(255);
  fill(255);

  textAlign(RIGHT);
  if(paused) text("paused", width - 10, height + 40);
  if(t.over) text("game over", width - 10, height + 40);
  else if(start) text("next: ", width/2 + 10, height + 40);
  textAlign(LEFT);

  if(start){

    line(0, height, width, height);
    text("score: " + t.score, 10, height + 40);
    if(!t.over){
      fill(255);
      stroke(10);
      for(int i = 0; i < 4; i++){

        rect(
          t.b.shapes[next][i][1]*2*t.res/3 + width/2 + 20,
          t.b.shapes[next][i][0]*2*t.res/3 + height + 30,
          2*t.res/3, 2*t.res/3
          );
      }
    }
  }
  else text("Tekan Apa Saja Untuk Mulai", 85, height/2 + 60);
}

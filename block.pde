//membuat kelas Block
class block{
  //Membuat variabel PVector posisition v dan a
  PVector position, v, a;
  boolean hit; //Membuat variabel boolean hit 
  int type;
  //Array current
  int[][][] current;
  //Array Shapes
  int[][][] shapes = {
  { //Kotak
    {0, 0},
    {0, -1},
    {-1, 0},
    {-1, -1}
  },
  { //L
    {0, 0},
    {0, 1},
    {-1, 0},
    {-2, 0}
  },
  { // |
    {0, 0},
    {1, 0},
    {-1, 0},
    {-2, 0}
  },
  { // T
    {0, 0},
    {0, 1},
    {0, -1},
    {1, 0}
  },
  { // Z
    {0, 0},
    {0, 1},
    {-1, 0},
    {-1, -1}
  },
  { //L terbalik
    {0, 0},
    {0, -1},
    {-1, 0},
    {-2, 0}
  },
  { // Z Terbalik
    {0, 0},
    {0, -1},
    {-1, 0},
    {-1, 1}
  }
  };

  //Constructor Block dengan paramter x
  block(int x){
    //deklarasi now 
    int now = next;
    //ambil random next
    next = int(random(7));
    current = shapes; //posisi saat ini adalah shapes yang digenerate
    position = new PVector(x, 80); //Posisi sama dengan vector x, 80
    v = new PVector(); //objek pVector
    a = new PVector(); //objek a
    type = now; //tipe adalah now
  }
  
  //Membuat fungsi update
  void update(){
    //Jika tidaka hit, maka a akan menambahkan gravitasi
    if(!hit) a.add(t.gravity);
    //V menambahkan a
    v.add(a);
    //Posiisi sesuai v
    position.add(v);
    a.mult(0);
  }
  //Fungsi Menampilkan 
  void display(){
    //Buat warna putih
    fill(255);
    //Looping untuk shape
    for(int i = 0; i < 4; i++){
      rect(
        current[type][i][1] * t.res + position.x,
        current[type][i][0] * t.res + position.y,
        t.res, t.res
      );
    }
  }
  //Funngsi cek
  void check(){ //vertical
    boolean blocked = false;
    if(!hit){ //kalaau tidak hit
      //Looping
      for(int i = 0; i < 4; i++){
        if(position.y + current[type][i][0] * t.res >= height - t.res) blocked = true;
        else if(t.grid[int(position.y/t.res) + current[type][i][0] + 1][int(position.x/t.res) + current[type][i][1]] == 1) blocked = true;
        if(blocked){

          for(int j = 0; j < 4; j++){

            if(int(position.y/t.res) + current[type][j][0] >= 0){

              t.grid[int(position.y/t.res) + current[type][j][0]]
                    [int(position.x/t.res) + current[type][j][1]] = 1;
            }
          }
          hit = true;
          break;
        }
      }
    }
  }
}

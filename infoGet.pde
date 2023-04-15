boolean fillt;
String path = "";
String size = "";
String size2 = "";
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
void setup(){
  size(500,400,P3D);
  windowResizable(true);
  surface.setTitle("My Program");
}
void draw(){
background(150);
fill(215);
noStroke();
rect(0,0,width,50);
fill(0);
textSize(15);
text("Получить инф-ю о файле...", 20, 30 );
if(!fillt){
fill(215);
}else{
fill(190);
}
rect(0, height-30, width, 30);
fill(0);
text("Открыть файл", width/2.5, height-10);
if (mousePressed && mouseX >0 && mouseX < width && mouseY > height-30 ){
fillt = true;
delay(100);
selectInput("Выберите файл", "fileSelected");
}else{
  fillt = false;
}
fill(210);
rect(5,55, path.length()*8.7,20);
rect(5,75, size.length() + size2.length()*12.75,20);
fill(0);

text("Путь: " + path, 5, 70);
text("Размер: " + size + size2, 5, 90);
}
void fileSelected(File file){
  if (file != null){
  path = file.getAbsolutePath();
  String fileName = path;
  Path path = Paths.get(fileName);
        try {

            // size of a file (in bytes)
            long bytes = Files.size(path);
           size = String.format("%,d мегабайт(ов) [MB]", bytes / 1024 / 1024);
           surface.setTitle(file.getName());
           size2 = String.format(" (%,d килобайт(ов) [KB])", bytes / 1024) + String.format(" (%,d байт(ов) [B])", bytes);
        } catch (IOException e) {
            e.printStackTrace();
        }
  }
}

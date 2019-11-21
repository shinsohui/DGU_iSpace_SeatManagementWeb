package model;

import java.util.ArrayList;

public class ColorBean {
   
   private ArrayList<String> ColorList = new ArrayList<String>();  //좌석 색
   private ArrayList<String> Room1Color = new ArrayList<String>();  //세미나실1 이용시간 색
   private ArrayList<String> Room2Color = new ArrayList<String>();  //세미나실2 이용시간 색


    public ArrayList<String> getColorList() {
        return ColorList;
    }

    public void setColorList(ArrayList<String> ColorList) {
        this.ColorList = ColorList;
    }
    

    public ArrayList<String> getRoom1Color() {
        return Room1Color;
    }

    public void setRoom1Color(ArrayList<String> Room1Color) {
        this.Room1Color = Room1Color;
    }
    
    public ArrayList<String> getRoom2Color() {
        return Room2Color;
    }

    public void setRoom2Color(ArrayList<String> Room2Color) {
        this.Room2Color = Room2Color;
    }
   
}
package com.bank;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Log {
    File file = new File("log.txt");
    Calendar cal = Calendar.getInstance();
    pointcut open() : call(void Bank.initBank());
    after(): open(){
    	
    	write(file,"Ingresando al Banco..." + " " + cal.getTime());
    	System.out.println("Ingresando al Banco...");
    }
    private static void write(File f,String data) {
 
        FileWriter fr = null;
        try {
            fr = new FileWriter(f);
            fr.write(data);
        } catch (IOException e) {
            e.printStackTrace();
        }finally{
            //close resources
            try {
                fr.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

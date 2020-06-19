package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();
	    pointcut llamar(): call(void Bank.moneyWithdrawal());
	    after(): llamar(){
	    	
	    	write(file,"\nIngresando al Banco...Retiros" + " " + cal.getTime());
	    	System.out.println("Saliendo de Retiros...");
	    	
}
	    private static void write(File file,String data) {
	    	
	    	BufferedWriter bw = null;
	        FileWriter fw = null;

	      try {
	        if (!file.exists()) {
	            file.createNewFile();
	        }
	      
	        fw = new FileWriter(file.getAbsoluteFile(), true);
	        bw = new BufferedWriter(fw);
	        
	        bw.write(data);
	        System.out.println("Saliendo de retiros");
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (bw != null)
	                bw.close();
	            if (fw != null)
	                fw.close();
	        } catch (IOException ex) {
	            ex.printStackTrace();
	        }
	        }
	        
	        }
	    }


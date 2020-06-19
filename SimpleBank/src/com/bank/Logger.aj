package com.bank;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Calendar;

public aspect Logger {
	    File file = new File("log.txt");
	    Calendar cal = Calendar.getInstance();

	    pointcut success() : call(* create*(..) );
	    after() : success() {
	    	System.out.println("**** User created ****");
	    }
}


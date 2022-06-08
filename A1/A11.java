package com.company.A1;

import java.io.FileReader;
import java.io.BufferedReader;
import java.util.Set;
import java.util.HashSet;

public class A11 {

    public static void main(String[] args) throws Exception {
        Set ids = getIdentifiers("A14.input");
        for (Object id : ids)
            System.out.println(id);
    }

    static boolean isLetter(int character) {
        return (character >= 'a' && character <= 'z') || (character >= 'A' && character <= 'Z');
    }

    static boolean isLetterOrDigit(int character) {
        return isLetter(character) || (character >= '0' && character <= '9');
    }

    public static Set getIdentifiers(String filename) throws Exception {
        String[] keywordsArray = {"IF", "WRITE", "READ", "RETURN", "BEGIN", "END", "MAIN", "INT", "REAL"};
        Set keywords = new HashSet();
        Set identifiers = new HashSet();
        for (String s : keywordsArray) {
            keywords.add(s);
        }
        FileReader reader = new FileReader(filename);
        BufferedReader br = new BufferedReader(reader);
        String line;


        while ((line = br.readLine()) != null) { //reads file line until finished
            String quotes = null; //var for quotes
            int i = 0;
            while (i < line.length()) {
                if (line.charAt(i) == '\"') { //looks for the first "
                    int temp = i; // First quote location
                    i++;
                    while (i < line.length() - 1 && line.charAt(i) != '\"') { //looks for the second "
                        //quotes = line.substring(temp, i+1); //creates substring for quotes
                        i++;
                    }
                    quotes = line.substring(temp, i+1); //creating variable for quotation, i+1 since substring [Start,end)
                    line = line.replaceAll(quotes, " "); //removes quotes from line
                    i-=quotes.length();
                }
                String word = null;
                if(i < line.length() && isLetter(line.charAt(i)))  {
                    int k = i;
                    i++;
                    while( i < line.length() && isLetterOrDigit(line.charAt(i))){
                        i++;
                    }
                    word = line.substring(k, i);

                    if(!keywords.contains(word)){
                        identifiers.add(word);
                    }


                }
                i++;
            }

        }
            return identifiers;
    }
}

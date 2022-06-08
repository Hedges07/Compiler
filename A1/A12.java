package com.company.A1;

import java.io.*;
import java.util.HashSet;
import java.util.Set;
import java.util.regex.*;

public class A12 {
    public static Set getIdRegex(String filename) throws Exception{
        String[] keywordsArray = { "IF", "WRITE", "READ", "RETURN", "BEGIN","END", "MAIN", "INT", "REAL" };
        Set keywords = new HashSet();
        Set identifiers = new HashSet();
        for (String s : keywordsArray)
            keywords.add(s);

        FileReader reader = new FileReader(filename);
        BufferedReader br = new BufferedReader(reader);
        String line;
        Pattern idPattern = Pattern.compile("\\w+");
        Pattern quotedStringPattern = Pattern.compile("((?<![\\\\])['\"])((?:.(?!(?<![\\\\])\\1))*.?)\\1");
        while ((line = br.readLine()) != null) {
            Matcher m_quotedString = quotedStringPattern.matcher(line);
            String lineWithoutQuotedStrings = m_quotedString.replaceAll("");
            Matcher m = idPattern.matcher(lineWithoutQuotedStrings);
            while (m.find()) {
                String id = line.substring(m.start(), m.end());
                if (!keywords.contains(id))
                    identifiers.add(id);
            }
        }
        return identifiers;
    }
    public static void main(String[] args) throws Exception{
        Set ids=getIdRegex("A15.input");
        for (Object id :ids)
            System.out.println(id);
    }
}
import java.util.*;

public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
	System.out.println();

	System.out.println("This is the Lowell Hymn.");
	System.out.println();
	
	String hymn[] = loadStrings("LowellHymn.txt");
	for(int i = 0; i < hymn.length; i++)
	{
		String [] hymnLine = hymn[i].split("\\s+");
		for(int a = 0; a < hymnLine.length; a++)
		{
			String temp = noPunc(hymnLine[a]).toLowerCase();
			System.out.print(pigLatin(temp) + " ");
		}
		System.out.println();
	}
}
public void draw()
{
}

public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	for(int v = 0; v < sWord.length(); v++)
	{
		if(sWord.substring(v,v+1).equals("a") ||
		   sWord.substring(v,v+1).equals("e") ||
		   sWord.substring(v,v+1).equals("i") ||
		   sWord.substring(v,v+1).equals("o") ||
		   sWord.substring(v,v+1).equals("u")
		   )
		{
			return v;
		}
	}
	return -1;
}

public String noPunc(String s)
{
	String answer = "";

	for(int i = 0; i < s.length(); i++)
	{
		if(s.charAt(i) != ',' && s.charAt(i) != '.')
		{
			answer = answer + s.substring(i,i+1);
		}
	}

	return answer;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(sWord.equals(""))
	{
		return "";
	}
	else if(sWord.length() > 1 && sWord.substring(0,2).equals("qu"))
	{
		return sWord.substring(2) + "qu" + "ay";
	}
	else if(findFirstVowel(sWord) == -1)
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0)
	{
		return sWord + "way";
	}
	else
	{
		int firstVowel = findFirstVowel(sWord);
		return sWord.substring(firstVowel) + sWord.substring(0,firstVowel) + "ay";
	}
}
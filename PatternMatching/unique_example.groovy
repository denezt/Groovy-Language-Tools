import java.util.ArrayList;
import java.io.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

File file = new File("dataset.txt");

def a = [:] 
a = [ firstname : 'Richard', lastname : 'Jackson' ]
println a.firstname

List<String> strings = new ArrayList<String>();
strings.add("this");
println(strings);

BufferedReader in = new BufferedReader(new FileReader(file));
String newInput;
int c = 0;

String pattern = "\\d{2}-\\d{5}"; 
Pattern r = Pattern.compile(pattern); 

while((newInput = in.readLine()) != null)
{
	c++;
	if (newInput?.trim()){
		println("\033[36m" + newInput.split(' ') + "\033[0m");
		println("\033[32m[" + c.toString() +"]\033[0m " + newInput);
		String[] s = newInput.split(' ')

		for (String input : s ){
			Matcher m = r.matcher(input); 
			if (m.find()){
				// println(m);
				println("\033[32mMatch was found: \033[32m" + m.toString());
			}
		}
	}	
}

in.close();

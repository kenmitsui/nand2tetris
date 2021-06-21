import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class Parser {
    private List<String> lines;
    private int currentLine = 0;
    public Parser(Path source){
        try {
            lines = Files.readAllLines(source);
            /*
            for (String s : lines) {
                System.out.println(s);
            }
            */
       } catch (IOException e) {
        System.err.println("File cannot be read");
        System.exit(1);
        }
    }

    public boolean hasMoreCommands(){
        return (currentLine < lines.size());
    }

    public void advance(){
        if(hasMoreCommands()){
            currentLine++;
        }
    }

    public String commandType(){
        // 空白行やコメント行はSkip
        String currentString = "";
        while(true){
            currentString = getTrimmedString(lines.get(currentLine));
            //currentString = lines.get(currentLine).trim(); // 先頭と末尾の空白がある場合は除去
            if(currentString.isEmpty() || "//".equals(currentString.substring(0, 2))){
                advance();
            }
            else{
                break;
            }
        }
        // コマンド行にたどり着いたので、その種類を返す
        if(currentString.startsWith("@")){return "A_COMMAND";}
        if(currentString.startsWith("(")){return "L_COMMAND";}
        return "C_COMMAND";
    }

    public String symbol(){
        String commandType  = commandType();
        String currentString = getTrimmedString(lines.get(currentLine));
        if("A_COMMAND".equals(commandType)){
            return currentString.substring(1);
        }
        if("L_COMMAND".equals(commandType)){
            return currentString.substring(1,currentString.length()-1);
        }
        return "";
    }

    public String dest(){
        String commandType  = commandType();
        String currentString = getTrimmedString(lines.get(currentLine));
        if("C_COMMAND".equals(commandType)){
            int end = currentString.indexOf('=');
            if(end == -1){return "";}
            return currentString.substring(0,end);
        }
        return "";
    }

    public String comp(){
        String commandType  = commandType();
        String currentString = getTrimmedString(lines.get(currentLine));
        if("C_COMMAND".equals(commandType)){
            int start = currentString.indexOf('='); // 無い場合は-1で、そのままでOK
            int end = currentString.indexOf(';');
            if(end == -1){end = currentString.length();}
            return currentString.substring(start+1,end);
        }
        return "";
    }

    public String jump(){
        String commandType  = commandType();
        String currentString = getTrimmedString(lines.get(currentLine));
        if("C_COMMAND".equals(commandType)){
            int start = currentString.indexOf(';');
            if(start == -1){return "";}
            return currentString.substring(start+1,currentString.length());
        }
        return "";
    }

    private String getTrimmedString(String input){
        String output = input.trim(); // 先頭と末尾の空白がある場合は除去
        // 「D=M // D = first number」のような場合に、更に不要なコメントと空白を除去
        int index = output.indexOf("/");
        if(index != -1){
            output = output.substring(0, index).trim();
        }
        return output;
    }

    public static void main(String args[]){
        if(args.length == 0){
            System.err.println("No file is specified");
            System.exit(1);
        }
        Path path = Paths.get(args[0]);
        if(!Files.exists(path)){
            System.err.println("Specified file is not found");
            System.exit(1);
        }
        //Parser parser = new Parser(path);
    }
}
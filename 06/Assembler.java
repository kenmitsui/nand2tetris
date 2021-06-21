import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class Assembler {
    public Assembler(){
    }

    public static void main(String args[]){
        if(args.length == 0){
            System.err.println("No file is specified");
            System.exit(1);
        }
        Path source = Paths.get(args[0]);
        if(!Files.exists(source)){
            System.err.println("Specified file is not found");
            System.exit(1);
        }

        List<String> outputList = new ArrayList<>();

        Parser parser = new Parser(source);
        Code code = new Code();
        while(parser.hasMoreCommands()){
            String commandType = parser.commandType();
            switch(commandType){
                case "A_COMMAND":
                case "L_COMMAND":
                String symbol = parser.symbol();
                outputList.add(
                    String.format("%16s", Integer.toBinaryString(Integer.parseInt(symbol))).replace(" ", "0"));
                break;
                case "C_COMMAND":
                String comp = code.comp(parser.comp());
                String dest = code.dest(parser.dest());
                String jump = code.jump(parser.jump());
                outputList.add("111" + comp + dest + jump);
            }
            parser.advance();
        }

        // 入力ファイル名が "(dir)/(filename).asm" なので、出力ファイル名を "(filename).hack" にする
        String filename = args[0].substring(args[0].lastIndexOf('/')+1, args[0].lastIndexOf('.'));
        Path target = Paths.get(filename + ".hack");

        // 既にファイルがある場合は一旦削除してから生成する
        try {
            Files.deleteIfExists(target);
            Files.createFile(target);
            Files.write(target, outputList, StandardOpenOption.WRITE);
            System.out.println("Target file is updated");
        } catch (IOException e) {
            System.err.println("File cannot be deleted or created");
            System.exit(1);
        }
    }
}
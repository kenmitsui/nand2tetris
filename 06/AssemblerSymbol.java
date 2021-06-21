import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class AssemblerSymbol {
    public AssemblerSymbol(){
    }

    private static int getDefinedAddress(String symbol){
        switch(symbol){
            case "SP": case "R0": return 0;
            case "LCL": case "R1": return 1;
            case "ARG": case "R2": return 2;
            case "THIS": case "R3": return 3;
            case "THAT": case "R4": return 4;
            case "R5": return 5;
            case "R6": return 6;
            case "R7": return 7;
            case "R8": return 8;
            case "R9": return 9;
            case "R10": return 10;
            case "R11": return 11;
            case "R12": return 12;
            case "R13": return 13;
            case "R14": return 14;
            case "R15": return 15;
            case "SCREEN": return 16384;
            case "KBD": return 24576;
        }
        return -1;
    }

    private static String getBinaryString(int number){
        return String.format("%16s", Integer.toBinaryString(number)).replace(" ", "0");
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
        SymbolTable table = new SymbolTable();
        String commandType, symbol, comp, dest, jump;
        int address = 16;
        int line = 0;

        // 1回目のループ（シンボルテーブルの作成）
        while(parser.hasMoreCommands()){
            commandType = parser.commandType();
            if(commandType == "L_COMMAND"){
                symbol = parser.symbol();
                if(!table.contains(symbol)){
                    table.addEntry(symbol, line); // L_COMMANDの行は削除されるので line++ はしない
                }
            }
            else{
                line++;
            }
            parser.advance();
        }

        // 2回目のループ（1行ごとのパース処理）
        parser = new Parser(source);
        while(parser.hasMoreCommands()){
            commandType = parser.commandType();
            if(commandType == "L_COMMAND"){
                // Skip
            }
            else if(commandType == "A_COMMAND"){
                symbol = parser.symbol(); // シンボル or 数字(10進数)
                try {
                    int number = Integer.parseInt(symbol);
                    // 数字。16桁の2進数に変換
                    outputList.add(getBinaryString(number));    
                } catch (Exception e) {
                    // シンボル
                    int definedAddress = getDefinedAddress(symbol);
                    if(definedAddress != -1){ // 定義済シンボル
                        outputList.add(getBinaryString(definedAddress));
                        }
                    else{
                        if(table.contains(symbol)){ // テーブルに登録済のシンボル
                            outputList.add(getBinaryString(table.getAddress(symbol)));
                        }
                        else{ // 変数
                            table.addEntry(symbol, address);
                            outputList.add(getBinaryString(address));
                            address++;
                        }
                    }
                }
            }
            else if(commandType == "C_COMMAND"){
                comp = code.comp(parser.comp());
                dest = code.dest(parser.dest());
                jump = code.jump(parser.jump());
                outputList.add("111" + comp + dest + jump);
            }
            parser.advance();
        }

        // 入力ファイル名が "(dir)/(filename).asm" なので、出力ファイル名を "(dir)/(filename).hack" にする
        String dir = args[0].substring(0, args[0].lastIndexOf('/'));
        String filename = args[0].substring(args[0].lastIndexOf('/')+1, args[0].lastIndexOf('.'));
        Path target = Paths.get(dir + "/" + filename + ".hack");

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
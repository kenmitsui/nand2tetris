import java.util.HashMap;
import java.util.Map;

public class SymbolTable {
    Map<String, Integer> map;

    public SymbolTable(){
       map = new HashMap<>();
    }

    public void addEntry(String symbol, int address){
        map.put(symbol, address);
    }

    public boolean contains(String symbol){
        return map.containsKey(symbol);
    }

    public int getAddress(String symbol){
        if(!contains(symbol)){
            return -1;
        }
        return map.get(symbol);
    }

    public void printAll(){
        System.out.println(map.values());
    }

    public static void main(String args[]){
    }
}
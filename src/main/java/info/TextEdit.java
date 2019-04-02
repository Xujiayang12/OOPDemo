package info;

import java.net.URLDecoder;

public class TextEdit {
    private String text;
    public static String de_coder(String old)
    {
        try {
            String new_text = URLDecoder.decode(old,"UTF-8");
            return new_text;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }
}

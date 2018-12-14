package utils;

import java.text.Normalizer;
import java.util.Random;
import java.util.regex.Pattern;

public class ConvertString {
	
	public static String createSlug(String title) {
		String slug = Normalizer.normalize(title, Normalizer.Form.NFD);
		Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+");
		slug = pattern.matcher(slug).replaceAll("");
		slug = slug.toLowerCase();
		// Thay đ thành d
		slug = slug.replaceAll("đ", "d");
		// Xóa các kí tự đặc biệt
		slug = slug.replaceAll("([^0-9a-z-\\s])", "");
		// Thay space thành dấu gạch ngang
		slug = slug.replaceAll("[\\s]", "-");
		// Ä‘á»•i nhiá»�u kÃ½ tá»± gáº¡ch ngang liÃªn tiáº¿p thÃ nh 1 kÃ½ tá»± gáº¡ch ngang
		slug = slug.replaceAll("(-+)", "-");
		// XÃ³a cÃ¡c kÃ½ tá»± gáº¡ch ngang á»Ÿ Ä‘áº§u vÃ  cuá»‘i
		slug = slug.replaceAll("^-+", "");
		slug = slug.replaceAll("-+$", "");
		return slug;
		}
	
	static final String AB = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
    static Random rnd = new Random();

    public static String randomString( int len ){
       StringBuilder sb = new StringBuilder( len );
       for( int i = 0; i < len; i++ ) 
          sb.append( AB.charAt( rnd.nextInt(AB.length()) ) );
       return sb.toString();
    }
}

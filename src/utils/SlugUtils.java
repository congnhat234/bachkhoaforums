package utils;

import java.text.Normalizer;  
import java.text.Normalizer.Form;  
import java.util.Locale;  
import java.util.regex.Pattern;  
  
public class SlugUtils {  
  
  private static final Pattern NONLATIN = Pattern.compile("[^\\w-]");  
  private static final Pattern EDGESDHASHES = Pattern.compile("(^-|-$)");
  private static final Pattern SEPARATORS = Pattern.compile("[\\s\\p{Punct}&&[^-]]");  

  
  public static String makeSlug(String input) {  
    String noseparators = SEPARATORS.matcher(input).replaceAll("-");
    String normalized = Normalizer.normalize(noseparators, Form.NFD);
    String slug = normalized.replace("đ", "d");
    slug = NONLATIN.matcher(slug).replaceAll(""); 
    slug = EDGESDHASHES.matcher(slug).replaceAll("");
    slug = slug.replace("-----", "-");
    slug = slug.replace("----", "-");
    slug = slug.replace("---", "-");
    slug = slug.replace("--", "-");
    return slug.toLowerCase(Locale.ENGLISH);  
  }  
} 
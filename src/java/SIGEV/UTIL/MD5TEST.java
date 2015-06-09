package SIGEV.UTIL;
import java.security.MessageDigest;
public class MD5TEST {
    public static void main(String[] args) throws Exception {
        System.out.println("Encriptando admin");
        System.out.println(md5("admin"));
    }    
    public static String md5(String clear) throws Exception {
        MessageDigest md = MessageDigest.getInstance("MD5");
        byte[] b = md.digest(clear.getBytes());
        
        int size = b.length;
        StringBuffer h = new StringBuffer(size);
        for (int i = 0; i < size; i++) {
            int u = b[i] & 255;
            if (u < 16) {
                h.append("0" + Integer.toHexString(u));
            } else {
                h.append(Integer.toHexString(u));
            }
        }
        return h.toString();
    }
}

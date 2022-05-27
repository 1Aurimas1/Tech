package org.glang.visitor;

import java.util.Arrays;
import java.util.List;

public class Encryption {
    public Object Encrypt(Object obj, int key){
        String temp = Integer.toString(key);
        int[] keyDigits = new int[temp.length()];
        for (int i = 0; i < temp.length(); i++)
        {
            keyDigits[i] = temp.charAt(i) - '0';
        }

        if (obj.getClass().isArray()) {
            //Object data = oldUselessApi.getData();
            List list;
            if (obj instanceof int[]) {
                list = Arrays.asList((int[])obj);
                for (int i = 0; i < list.size(); i++) {

                }
            }
            else if (obj instanceof double[]) {
                list = Arrays.asList((double[])obj);
                for (int i = 0; i < list.size(); i++) {

                }
            }
            else if (obj instanceof char[]) {
                list = Arrays.asList((char[])obj);
                for (int i = 0; i < list.size(); i++) {

                }
            }
//            if (obj.getClass() == Integer.class) {
//                int value = (int) obj;
//                value += key;
//                return value;
//            } else if (obj.getClass() == Double.class) {
//                double value = (double) obj;
//                value += key;
//                return value;
//            } else if (obj.getClass() == Character.class) {
//                char value = obj.toString().charAt(0);
//                value += key;
//                return value;
//            }
        } else {
            if (obj.getClass() == Integer.class) {
                int value = (int) obj;
                value += key;
                return value;
            } else if (obj.getClass() == Double.class) {
                double value = (double) obj;
                value += key;
                return value;
            } else if (obj.getClass() == Character.class) {
                char value = obj.toString().charAt(0);
                value += key;
                return value;
            }
        }
        return null;
    }

    public void Decrypt(Object obj, int key){

    }
}

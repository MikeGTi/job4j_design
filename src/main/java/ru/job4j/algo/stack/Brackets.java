package ru.job4j.algo.stack;

import java.util.HashMap;
import java.util.Stack;

public class Brackets implements Validator {

    char[] openChars = new char[]{'(', '[', '{'};
    char[] closeChars = new char[]{')', ']', '}'};

    public boolean isValid(String s) {
        if (s.length() == 0) {
            return true;
        } else if (!isStartConditionsSatisfied(s)) {
            return false;
        }

        HashMap<Character, Character> openToCloseCharsMap = new HashMap<>();
        for (int i = 0; i < openChars.length; i++) {
            openToCloseCharsMap.put(openChars[i], closeChars[i]);
        }

        char[] chars = s.toCharArray();
        Stack<Character> stack = new Stack<>();
        stack.push(chars[0]);
        for (int i = 1; i < chars.length; i++) {
            Character c = chars[i];
            if (stack.empty() || openToCloseCharsMap.containsKey(c) ||  c != openToCloseCharsMap.get(stack.peek())) {
                stack.push(c);
            } else {
                stack.pop();
            }
        }
        return stack.empty();
    }

    private boolean isStartConditionsSatisfied(String s) {
        for (int i = 0; i < openChars.length; i++) {
            if (s.length() % 2 != 0 || s.startsWith(Character.toString(closeChars[i])) || s.endsWith(Character.toString(openChars[i]))) {
                return false;
            }
        }
        return true;
    }
}

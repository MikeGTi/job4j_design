package ru.job4j.algo.stack;

import java.util.Stack;

public class Path {
    public String simplify(String path) {
        Stack<String> stack = new Stack<>();
        String[] components = path.split("/");
        for (var component : components) {
            if (component.equals("..")) {
                stack.pop();
            } else if (!component.isEmpty() && !component.equals(".")) {
                stack.push(component);
            }
        }
        var result = new StringBuilder();
        for (String dir : stack) {
            result.append("/").append(dir);
        }
        return !result.isEmpty() ? result.toString() : "/";
    }
}

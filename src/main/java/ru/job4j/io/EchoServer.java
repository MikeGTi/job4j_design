package ru.job4j.io;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

public class EchoServer {
    public static void main(String[] args) throws IOException {
        try (ServerSocket server = new ServerSocket(9000)) {
            while (!server.isClosed()) {
                Socket socket = server.accept();
                try (OutputStream output = socket.getOutputStream();
                     BufferedReader input = new BufferedReader(
                             new InputStreamReader(socket.getInputStream()))) {
                    output.write("HTTP/1.1 200 OK\r\n\r\n".getBytes());

                    Map<String, List<String>> params = getQueryParams(input.readLine());
                    String msg = (params.get("msg") != null) ? params.get("msg").get(0).toLowerCase() : "";

                    if (msg.startsWith("exit")) {
                        break;
                    } else {
                        if (msg.startsWith("hello")) {
                            output.write("Hello!".getBytes());
                        } else {
                            output.write("What?".getBytes());
                        }
                    }
                    output.flush();
                }
            }
        }
    }

    private static Map<String, List<String>> getQueryParams(String url) {
        Map<String, List<String>> params = new HashMap<>();
        String[] urlParts = url.split("\\?");
        if (urlParts.length > 1) {
            String query = urlParts[1];
            for (String param : query.split("&")) {
                String[] pair = param.split("=");
                String key = URLDecoder.decode(pair[0], StandardCharsets.UTF_8);
                String value = "";
                if (pair.length > 1) {
                    value = URLDecoder.decode(pair[1], StandardCharsets.UTF_8);
                }
                List<String> values = params.computeIfAbsent(key, k -> new ArrayList<>());
                values.add(value);
            }
        }
        return params;
    }
}
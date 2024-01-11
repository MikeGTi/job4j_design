package ru.job4j.io;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.net.ServerSocket;
import java.net.Socket;

public class EchoServer {

    private static final Logger ECHO_SERVER = LoggerFactory.getLogger(UsageLog4j.class.getName());

    public static void main(String[] args) {
        try (ServerSocket server = new ServerSocket(9000)) {
            while (!server.isClosed()) {
                Socket socket = server.accept();
                try (OutputStream output = socket.getOutputStream();
                     BufferedReader input = new BufferedReader(
                             new InputStreamReader(socket.getInputStream()))) {
                    output.write("HTTP/1.1 200 OK\r\n\r\n".getBytes());

                    String inpReq = input.readLine().toLowerCase();
                    if (inpReq.contains("msg=exit")) {
                        server.close();
                    } else {
                        if (inpReq.contains("msg=hello")) {
                            output.write("Hello!".getBytes());
                        } else {
                            output.write("What?".getBytes());
                        }
                    }
                    output.flush();
                }
            }
        } catch (IOException e) {
            ECHO_SERVER.error("Error i/o: ", e);
        }
    }
}
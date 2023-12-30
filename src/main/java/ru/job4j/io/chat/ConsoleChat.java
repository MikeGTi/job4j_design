package ru.job4j.io.chat;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class ConsoleChat {
    private static final String OUT = "закончить";
    private static final String STOP = "стоп";
    private static final String CONTINUE = "продолжить";
    private final String logPath;
    private final String botAnswers;

    public ConsoleChat(String logPath, String botAnswers) {
        this.logPath = logPath;
        this.botAnswers = botAnswers;
    }

    public void run() {
        List<String> chatLog = new ArrayList<>();
        List<String> botPhrases = readPhrases();
        Random rnd = new Random();
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        boolean botShutUp = false;
        String line = "";
        chatLog.add(line);
        String answer;
        try (br) {
            while ((line = br.readLine()) != null && !OUT.equalsIgnoreCase(line)) {
                chatLog.add(line);
                if (STOP.equalsIgnoreCase(line) || CONTINUE.equalsIgnoreCase(line)) {
                    botShutUp = !botShutUp;
                }
                if (!botShutUp) {
                    answer = botPhrases.get(rnd.nextInt(botPhrases.size()));
                    System.out.println(answer);
                    System.out.flush();
                    chatLog.add(answer);
                }
            }
        } catch (IOException e) {
            System.err.println("Invalid console input");
        }
        saveLog(chatLog);
    }

    private List<String> readPhrases() {
        return Arrays.stream(new UsageEncoding().readFile(botAnswers).split(System.lineSeparator())).toList();
    }

    private void saveLog(List<String> log) {
        StringJoiner sj = new StringJoiner(System.lineSeparator());
        log.forEach(sj::add);
        new UsageEncoding().writeDataInFile(logPath, sj.toString());
    }

    public static void main(String[] args) {
        ConsoleChat consoleChat = new ConsoleChat("./src/data/chat/chat.log", "./src/data/chat/botAnswers.txt");
        consoleChat.run();
    }
}

package ru.job4j.io;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class UsageLog4j {

    private static final Logger LOG = LoggerFactory.getLogger(UsageLog4j.class.getName());

    public static void main(String[] args) {
        /*LOG.trace("trace message");
        LOG.debug("debug message");
        LOG.info("info message");
        LOG.warn("warn message");
        LOG.error("error message");*/

        /*String name = "Petr Arsentev";
        int age = 33;
        LOG.debug("User info name : {}, age : {}", name, age);*/

        float flt = 0.001f;
        double dbl = 0.01;
        byte bt = 21;
        short shrt = 254;
        int int1 = 999;
        long lng = 1L;
        boolean bln = true;
        char chr = 'F';

        LOG.debug("Print variables in log:");
        LOG.debug("float : {}, double : {}, byte : {}, short : {}, int : {}, long : {}, boolean : {}, char : {}", flt, dbl, bt, shrt, int1, lng, bln, chr);
    }
}
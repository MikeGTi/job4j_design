package ru.job4j.ood.srp.report;

import javax.xml.bind.annotation.adapters.XmlAdapter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class CalendarAdapterXml extends XmlAdapter<String, Calendar> {

    /* private static final ThreadLocal<DateFormat> DATE_FORMAT = ThreadLocal.withInitial(() -> new SimpleDateFormat("dd:MM:yyyy HH:mm")); */

    private static final SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd:MM:yyyy HH:mm");
    @Override
    public Calendar unmarshal(String date) throws ParseException {
        Calendar calendar = Calendar.getInstance();
                 calendar.setTime(DATE_FORMAT.parse(date));
          return calendar;
    }

    @Override
    public String marshal(Calendar date) {
        return DATE_FORMAT.format(date.getTime());
    }
}

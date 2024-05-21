package ru.job4j.ood.srp.report;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import ru.job4j.ood.srp.model.Employee;
import ru.job4j.ood.srp.store.IStore;

import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.function.Predicate;

public class ReportJson implements IReport {

    private final IStore store;

    private final GsonBuilder gsonBuilder;

    public ReportJson(IStore store, GsonBuilder gsonBuilder) {
        this.store = store;
        this.gsonBuilder = gsonBuilder;
    }

    @Override
    public String generate(Predicate<Employee> filter) {
        gsonBuilder.registerTypeAdapter(Calendar.class, new CalendarAdapterJson());
        gsonBuilder.registerTypeAdapter(GregorianCalendar.class, new CalendarAdapterJson());
        final Gson gson = gsonBuilder.create();
        final List<Employee> employees = store.findBy(filter);
        return gson.toJson(employees);
    }
}

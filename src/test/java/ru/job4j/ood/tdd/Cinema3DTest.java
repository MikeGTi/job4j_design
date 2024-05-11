package ru.job4j.ood.tdd;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

import java.util.Calendar;
import java.util.List;

@Disabled("Тесты отключены. Удалить аннотацию после реализации всех методов по заданию.")
public class Cinema3DTest {
    @Test
    public void whenBuyThenGetTicket() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        Ticket ticket = cinema.buy(account, 1, 1, date);
        assertNotNull(ticket);
        assertTrue(ticket instanceof Ticket3D);
        assertEquals(ticket, new Ticket3D());
    }

    @Test
    public void whenSellMultipleTickets() {
        Account account1 = new Account3D();
        Account account2 = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date1 = Calendar.getInstance();
        Calendar date2 = Calendar.getInstance();
        Ticket ticket1 = cinema.buy(account1, 1, 1, date1);
        Ticket ticket2 = cinema.buy(account2, 2, 2, date2);
        assertNotNull(ticket1);
        assertNotNull(ticket2);
        assertNotEquals(ticket1, ticket2);
    }

    @Test
    public void whenCannotSellTicketForTakenSeat() {
        Account account1 = new Account3D();
        Account account2 = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        Session session = new Session3D();
        cinema.add(session);
        Ticket ticket1 = cinema.buy(account1, 1, 1, date);
        assertNotNull(ticket1);
        assertThrows(IllegalArgumentException.class, () -> cinema.buy(account2, 1, 1, date));
    }

    @Test
    public void whenBuyOnInvalidRowThenGetException() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        assertThrows(IllegalArgumentException.class, () -> cinema.buy(account, -1, 1, date));
    }

    @Test
    public void whenBuyOnInvalidRowColumnThenGetException() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        assertThrows(IllegalArgumentException.class, () -> cinema.buy(account, -1, -1, date));
    }

    @Test
    public void whenBuyOnInvalidColumnThenGetException() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        assertThrows(IllegalArgumentException.class, () -> cinema.buy(account, 1, -1, date));
    }

    @Test
    public void whenBuyOnInvalidDateThenGetException() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        date.set(Calendar.YEAR, 2000);
        assertThrows(IllegalArgumentException.class, () -> cinema.buy(account, 1, 1, date));
    }

    /* Cinema3D can sell a ticket to a customer for a valid seat and date, and the ticket is added to the customer's account */
    @Test
    public void whenSellTicketValidSeatAndDate() {
        Account account = new Account3D();
        Cinema cinema = new Cinema3D();
        Calendar date = Calendar.getInstance();
        Ticket ticket = cinema.buy(account, 1, 1, date);
        assertNotNull(ticket);
        /*assertEquals(account, ticket.getAccount());
        assertEquals(1, ticket.getRow());
        assertEquals(1, ticket.getColumn());
        assertEquals(date, ticket.getDate());*/
    }

    @Test
    public void whenAddSessionThenSessionsContainIt() {
        Cinema cinema = new Cinema3D();
        Session session = new Session3D();
        cinema.add(session);
        List<Session> sessions = cinema.find(data -> true);
        assertTrue(sessions.contains(session));
    }

    @Test
    public void whenAddNullSessionThanException() {
        Cinema cinema = new Cinema3D();
        assertThrows(IllegalArgumentException.class, () -> cinema.add(null));
    }

    @Test
    public void whenCannotFindSessionsThanEmpty() {
        Cinema cinema = new Cinema3D();
        List<Session> sessions = cinema.find(data -> true);
        assertTrue(sessions.isEmpty());
    }

    @Test
    public void whenAddSessionsToSessionsList() {
        Cinema cinema = new Cinema3D();
        Session session1 = new Session3D();
        Session session2 = new Session3D();
        Session session3 = new Session3D();

        cinema.add(session1);
        cinema.add(session2);
        cinema.add(session3);

        List<Session> sessions = cinema.find(data -> true);

        assertTrue(sessions.contains(session1));
        assertTrue(sessions.contains(session2));
        assertTrue(sessions.contains(session3));
    }
}
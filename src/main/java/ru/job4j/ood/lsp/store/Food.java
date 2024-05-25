package ru.job4j.ood.lsp.store;

import java.util.Date;

public class Food {
    private Long id;
    private String name;
    private Date createDate;
    private Date expiryDate;
    private Double price;
    private byte discount;

    public Food(Long id, String name, Date createDate, Date expiryDate, Double price) {
        this.id = id;
        this.name = name;
        this.expiryDate = expiryDate;
        this.createDate = createDate;
        this.price = price;
    }

    public byte expirePercent(Date now) {
        byte rsl;
        if (now.equals(createDate)) {
            rsl = 0;
        } else if (now.after(expiryDate)) {
            rsl = 100;
        } else {
            long age = now.getTime() - createDate.getTime();
            long life = expiryDate.getTime() - createDate.getTime();
            rsl = (byte) Math.round((float) (age * 100) / life);
        }
        return rsl;
    }

    public Long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setDiscount(byte discount) {
        if (discount > -1 && discount < 101) {
            this.discount = discount;
        }
    }

    public byte getDiscount() {
        return discount;
    }

}

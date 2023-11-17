package ru.job4j.generic;

public class Role extends Base {

    private final RolesEnum role;

    public Role(String id, RolesEnum name) {
        super(id);
        this.role = name;
    }

    public RolesEnum getRole() {
        return role;
    }
}
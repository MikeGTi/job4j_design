package ru.job4j.generic;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class RoleStoreTest {

    @Test
    void whenAddAndFindThenRoleIsSuper() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        Role result = store.findById("1");
        assertThat(result.getRole()).isEqualTo(RolesEnum.SUPER);
    }

    @Test
    void whenAddAndFindThenRoleIsNull() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        Role result = store.findById("10");
        assertThat(result).isNull();
    }

    @Test
    void whenAddDuplicateAndFindRoleIsSuper() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        store.add(new Role("1", RolesEnum.ADMIN));
        Role result = store.findById("1");
        assertThat(result.getRole()).isEqualTo(RolesEnum.SUPER);
    }

    @Test
    void whenReplaceThenRoleIsGuest() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        store.replace("1", new Role("1", RolesEnum.GUEST));
        Role result = store.findById("1");
        assertThat(result.getRole()).isEqualTo(RolesEnum.GUEST);
    }

    @Test
    void whenNoReplaceRoleThenNoChangeRole() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        store.replace("10", new Role("10", RolesEnum.GUEST));
        Role result = store.findById("1");
        assertThat(result.getRole()).isEqualTo(RolesEnum.SUPER);
    }

    @Test
    void whenDeleteRoleThenRoleIsNull() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        store.delete("1");
        Role result = store.findById("1");
        assertThat(result).isNull();
    }

    @Test
    void whenNoDeleteRoleThenRoleIsPetr() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        store.delete("10");
        Role result = store.findById("1");
        assertThat(result.getRole()).isEqualTo(RolesEnum.SUPER);
    }

    @Test
    void whenReplaceOkThenTrue() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        boolean result = store.replace("1", new Role("1", RolesEnum.GUEST));
        assertThat(result).isTrue();
    }

    @Test
    void whenReplaceNotOkThenFalse() {
        RoleStore store = new RoleStore();
        store.add(new Role("1", RolesEnum.SUPER));
        boolean result = store.replace("10", new Role("10", RolesEnum.GUEST));
        assertThat(result).isFalse();
    }
}
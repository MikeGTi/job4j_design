package ru.job4j.generic;

public class User extends Base {

    private final String username;

    public User(String id, String username) {
        super(id);
        this.username = username;
    }

    public String getId() {
        return super.getId();
    }

    public void setId(String id) {
        super.setId(id);
    }

    public String getUsername() {
        return username;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof User user)) {
            return false;
        }
        if (getId().equals(user.getId())) {
            return false;
        }
        return getUsername() != null ? getUsername().equals(user.getUsername()) : user.getUsername() == null;
    }

    @Override
    public int hashCode() {
        int result = Integer.parseInt(getId());
        result = 31 * result + (getUsername() != null ? getUsername().hashCode() : 0);
        return result;
    }
}
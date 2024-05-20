package ru.job4j.ood.ocp.violators.password;

public class PasswordValidator {
    private static final int MIN_LENGTH = 8;

    public boolean isValid(PasswordChangeModel passwordChangeModel) {
        if (passwordChangeModel.newPassword.length() < MIN_LENGTH
            || passwordChangeModel.newPassword == passwordChangeModel.username
            || (passwordChangeModel.passwordHistoryItems != null
                && passwordChangeModel.passwordHistoryItems.contains(passwordChangeModel.newPassword))) {
            return false;
        }
        return true;
    }
}

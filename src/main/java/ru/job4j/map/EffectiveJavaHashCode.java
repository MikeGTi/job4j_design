package ru.job4j.map;

public class EffectiveJavaHashCode {

    private static final int HASH_SUM_ELEMENT = 17;

    public int booleanHashCode(boolean value) {
        return HASH_SUM_ELEMENT + (value ? 1 : 0);
    }

    public int byteHashCode(byte value) {
        return HASH_SUM_ELEMENT + (int) value;
    }

    public int charHashCode(char value) {
        return HASH_SUM_ELEMENT + (int) value;
    }

    public int shortHashCode(short value) {
        return HASH_SUM_ELEMENT + (int) value;
    }

    public int intHashCode(int value) {
        return HASH_SUM_ELEMENT + value;
    }

    public int longHashCode(long value) {
        return HASH_SUM_ELEMENT + (int) (value ^ (value >>> 32));
    }

    public int floatHashCode(float value) {
        return HASH_SUM_ELEMENT + Float.floatToIntBits(value);
    }

    public int doubleHashCode(double value) {
        return HASH_SUM_ELEMENT + (int) (Double.doubleToLongBits(value) ^ (Double.doubleToLongBits(value) >>> 32));
    }
}

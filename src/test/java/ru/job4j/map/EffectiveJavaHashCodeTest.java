package ru.job4j.map;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.assertj.core.api.Assertions.*;

class EffectiveJavaHashCodeTest {
    EffectiveJavaHashCode ej;

    @BeforeEach
    void setUp() {
        ej = new EffectiveJavaHashCode();
    }

    @Test
    void whereCheckBooleanHashCode() {
        boolean one = true;
        boolean two = true;
        boolean three = false;
        boolean four = false;
        assertThat(ej.booleanHashCode(one)).isEqualTo(ej.booleanHashCode(two));
        assertThat(ej.booleanHashCode(three)).isEqualTo(ej.booleanHashCode(four));
        assertThat(ej.booleanHashCode(one)).isNotEqualTo(ej.booleanHashCode(three));
    }

    @Test
    void whereCheckByteHashCode() {
        byte one = 1;
        byte two = 1;
        assertThat(ej.byteHashCode(one)).isEqualTo(ej.byteHashCode(two));
    }

    @Test
    void whereCheckCharHashCode() {
        char one = 'A';
        char two = 'A';
        assertThat(ej.charHashCode(one)).isEqualTo(ej.charHashCode(two));
    }

    @Test
    void whereCheckShortHashCode() {
        short one = 255;
        short two = 255;
        assertThat(ej.shortHashCode(one)).isEqualTo(ej.shortHashCode(two));
    }

    @Test
    void whereCheckIntHashCode() {
        int one = 1024;
        int two = 1024;
        assertThat(ej.intHashCode(one)).isEqualTo(ej.intHashCode(two));
    }

    @Test
    void whereCheckLongHashCode() {
        long one = 2048;
        long two = 2048;
        assertThat(ej.longHashCode(one)).isEqualTo(ej.longHashCode(two));
    }

    @Test
    void whereCheckFloatHashCode() {
        float one = 0.01f;
        float two = 0.01f;
        assertThat(ej.floatHashCode(one)).isEqualTo(ej.floatHashCode(two));
    }

    @Test
    void whereCheckDoubleHashCode() {
        double one = 0.001;
        double two = 0.001;
        assertThat(ej.doubleHashCode(one)).isEqualTo(ej.doubleHashCode(two));
    }
}
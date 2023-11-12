package ru.job4j.assertj;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.*;

class BoxTest {

    @Test
    void isThisSphere() {
        Box box = new Box(0, 10);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Sphere");
    }

    @Test
    void isThisTetrahedron() {
        Box box = new Box(4, 10);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Tetrahedron");
    }

    @Test
    void isThisCube() {
        Box box = new Box(8, 10);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Cube");
    }

    @Test
    void isThisUnknownObject() {
        Box box = new Box(10, 10);
        String name = box.whatsThis();
        assertThat(name).isEqualTo("Unknown object");
    }

    @Test
    void whenVertexNot0_4_8ThenNumberVerticesMinus1() {
        Box box = new Box(2147483647, 10);
        int vertices = box.getNumberOfVertices();
        assertThat(vertices).isEqualTo(-1);
    }

    @Test
    void whenVertex0_4_8ThenIsExistTrue() {
        assertThat(new Box(0, 10).isExist()).isTrue();
        assertThat(new Box(4, 10).isExist()).isTrue();
        assertThat(new Box(8, 10).isExist()).isTrue();
    }

    @Test
    void whenVertexNot0_4_8ThenIsExistFalse() {
        assertThat(new Box(10, 10).isExist()).isFalse();
    }

    @Test
    void whenVertex0_4_8ThenAreaMore0() {
        assertThat(new Box(0, 10).getArea()).isGreaterThan(0d);
        assertThat(new Box(4, 10).getArea()).isGreaterThan(0d);
        assertThat(new Box(8, 10).getArea()).isGreaterThan(0d);
    }

    @Test
    void whenVertexNon0_4_8ThenArea0() {
        assertThat(new Box(10, 10).getArea()).isEqualTo(0d);
        assertThat(new Box(16, 10).getArea()).isEqualTo(0d);
        assertThat(new Box(2147483647, 10).getArea()).isEqualTo(0d);
    }
}
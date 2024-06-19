package ru.job4j.ood.lsp.parking;


import java.util.List;

public interface IParking<IVehicle> {

    boolean park(IVehicle v);

    boolean parkAll(List<IVehicle> vs);

    IVehicle leave(Long id) throws ParkingException;

    /*List<IVehicle> leaveAll(List<Long> ids) throws ParkingException;*/

    boolean hasPlace(int size);

}
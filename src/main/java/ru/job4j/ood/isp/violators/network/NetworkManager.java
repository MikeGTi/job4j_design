package ru.job4j.ood.isp.violators.network;

/*  Нарушен Interface Segregation Principle (ISP),
 *  Класс NetworkManager нарушает принцип разделения интерфейсов,
 *  т.к. не только запрашивает данные, но и обновляет UI.
 *
 *  Решение: Разделить реализуемый интерфейс INetworkManager на два:
 *  IDataManager и IUiManager
 */
public class NetworkManager implements INetworkManager {
    public void fetchData(String url) {
         /* API request */
    }

    public void updateUI() {
        /* user interface update */
    }
}

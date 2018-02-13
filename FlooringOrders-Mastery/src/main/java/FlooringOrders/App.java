/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FlooringOrders;

import FlooringOrdersController.Controller;
import FlooringOrdersDAO.Dao;
import FlooringOrdersDAO.DaoFileImpl;
import FlooringOrdersDAO.FlooringOrderAuditDaoFileImpl;
import FlooringOrdersServiceLayer.Service;
import FlooringOrdersServiceLayer.ServiceImpl;
import FlooringOrdersUI.UserIO;
import FlooringOrdersUI.UserIOImpl;
import FlooringOrdersUI.View;
import FlooringOrdersDAO.FlooringOrderAuditDao;

/**
 *
 * @author laptop
 */
public class App {

    public static void main(String[] args) {

        UserIO myUserIO = new UserIOImpl();

        View myView = new View(myUserIO);//The view takes a particular IOimplementation

        Dao myDao = new DaoFileImpl();
        
        FlooringOrderAuditDao myAuditDao = new FlooringOrderAuditDaoFileImpl();

        Service myService = new ServiceImpl(myDao, myAuditDao);//This takes a particular Dao implmenetation

        Controller myController = new Controller(myView, myService); //This constructor takes a view and a service

        myController.run();
    }

}

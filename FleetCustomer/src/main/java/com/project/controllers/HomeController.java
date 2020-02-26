package com.project.controllers;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import CustomerFleetDao.CustomerFleetDao;
import CustomerFleetDao.CustomerFleetDaoImpl;
import com.project.fleet.CustomerFleet;
import com.project.fleet.CustomerFleetJoin;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.project.fleet.Customer;
import com.project.fleet.FleetInfo;

import CustomerDao.CustomerDaoImpl;
import FleetDao.FleetDaoImpl;


@Controller
public class HomeController {

    @GetMapping(value = "/")

    public String showHomePage(Model model) throws SQLException {
        System.out.println("In HomePage");
        List<Customer> allCustomers = new CustomerDaoImpl().getAllCustomers();
        System.out.println(allCustomers);
        model.addAttribute("CustomerList", allCustomers);
        Map<Integer, FleetInfo> fleetMap = new HashMap<>();
        List<FleetInfo> allFleetInfo = new FleetDaoImpl().getAllFleet();
        for (FleetInfo f : allFleetInfo) {
            fleetMap.put(f.getFleet_id(), f);
        }
        System.out.println(allFleetInfo);
        CustomerFleetDao customerFleet = new CustomerFleetDaoImpl();
        List<CustomerFleet> customerFleets = customerFleet.getAllCustomerFleet();
		List<CustomerFleetJoin> customerFleetJoins = new ArrayList<>();
		for (Customer c: allCustomers) {
			CustomerFleetJoin cfj = new CustomerFleetJoin();
			List<FleetInfo> fi = new ArrayList<>();
			for (CustomerFleet cf: customerFleets) {
			    if (cf.getCustomerId() == c.getCustomerId()) {
			        fi.add(fleetMap.get(cf.getFleet_id()));
                }
            }
			customerFleetJoins.add(cfj);
		}
        model.addAttribute("FleetList", allFleetInfo);
        model.addAttribute("CustomerFleetJoins", customerFleetJoins);
        return "fleetlist";
    }
}



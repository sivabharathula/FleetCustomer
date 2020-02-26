package com.project.fleet;

import java.util.List;

public class CustomerFleetJoin extends Customer {

    public List<FleetInfo> getFleetInfos() {
        return fleetInfos;
    }

    public void setFleetInfos(List<FleetInfo> fleetInfos) {
        this.fleetInfos = fleetInfos;
    }

    private List<FleetInfo> fleetInfos;


}

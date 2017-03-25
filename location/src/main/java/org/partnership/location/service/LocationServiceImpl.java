package org.partnership.location.service;

import java.util.List;

import org.partnership.location.model.Location;
import org.partnership.location.repository.LocationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LocationServiceImpl implements LocationService{

	@Autowired
	private LocationRepository locationRepository;
	
	public List<Location> findAll() {
		return locationRepository.findAll();
	}

}

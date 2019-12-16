package com.mhmaem.bootstrap.services;

import javax.transaction.Transactional;

import com.mhmaem.bootstrap.models.AppUser;
import com.mhmaem.bootstrap.models.UpdateUserDeviceTokenRequest;

public class UsersService {

	@Transactional
	public static UpdateUserDeviceTokenRequest updateUserDeviceToken(UpdateUserDeviceTokenRequest deviceTokenRequest,
			AppUser activeAppUser) {
		activeAppUser.deviceToken = deviceTokenRequest.userDeviceToken;
		activeAppUser.persist();
		return deviceTokenRequest;
	}

}

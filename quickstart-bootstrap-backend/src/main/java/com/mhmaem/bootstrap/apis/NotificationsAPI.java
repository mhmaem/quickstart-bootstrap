package com.mhmaem.bootstrap.apis;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.mhmaem.bootstrap.models.AppUser;
import com.mhmaem.bootstrap.models.NotificationRequest;
import com.mhmaem.bootstrap.notifications.NotificationsManager;

@Path("/notify")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class NotificationsAPI {

    @POST
    public NotificationRequest list(NotificationRequest notificationRequest) {
        notificationRequest.deviceID = AppUser.getAppUserWithName(notificationRequest.deviceID).deviceToken;
        NotificationsManager.sendGeneralNotification(notificationRequest);
        return notificationRequest;
    }

}

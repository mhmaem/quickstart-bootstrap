package com.mhmaem.bootstrap.apis;

import javax.annotation.security.RolesAllowed;
import javax.transaction.Transactional;
import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.SecurityContext;

import com.mhmaem.bootstrap.models.AppUser;
import com.mhmaem.bootstrap.models.UpdateUserDeviceTokenRequest;
import com.mhmaem.bootstrap.services.UsersService;

@Path("/users")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public class AppUsersAPI {

    @POST
    @Path("/adduser")
    @Transactional
    public AppUser addUser(AppUser newUser) {
        return AppUser.persistNewUser(newUser, "USER", null);
    }

    @POST
    @Path("/addsuperadmin")
    @Transactional
    public AppUser addSuperAdmin(AppUser newUser) {
        return AppUser.persistNewUser(newUser, "SUPERADMIN", null);
    }

    @POST
    @RolesAllowed("SUPERADMIN")
    @Path("/addadmin")
    @Transactional
    public AppUser addAdmin(@Context SecurityContext securityContext, AppUser newUser) {
        return AppUser.persistNewUser(newUser, "ADMIN", AppUser.getActiveAppUser(securityContext));
    }

    @POST
    @RolesAllowed("ADMIN")
    @Path("/addagency")
    @Transactional
    public AppUser addAgency(@Context SecurityContext securityContext, AppUser newUser) {
        return AppUser.persistNewUser(newUser, "AGENCY", AppUser.getActiveAppUser(securityContext));
    }

    @POST
    @RolesAllowed("AGENCY")
    @Path("/addagent")
    @Transactional
    public AppUser addAgent(@Context SecurityContext securityContext, AppUser newUser) {
        return AppUser.persistNewUser(newUser, "AGENT", AppUser.getActiveAppUser(securityContext));
    }

    @POST
    @Path("/login")
    public AppUser loginUser(AppUser user) {
        return AppUser.find("username = ?1 and password = ?2", user.username, user.password).firstResult();
    }

    @POST
    @RolesAllowed("USER")
    @Path("/updateuserdevicetoken")
    @Transactional
    public UpdateUserDeviceTokenRequest updateUserDeviceToken(@Context SecurityContext securityContext,
            UpdateUserDeviceTokenRequest deviceTokenRequest) {
        return UsersService.updateUserDeviceToken(deviceTokenRequest,
                AppUser.getActiveAppUser(securityContext));
    }

}

package com.mhmaem.bootstrap.models;

import java.time.LocalDateTime;

import javax.json.bind.annotation.JsonbTransient;
import javax.persistence.Cacheable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.transaction.Transactional;
import javax.ws.rs.core.SecurityContext;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@Entity
@Cacheable
@JsonIgnoreProperties(value = { "id", "role", "enabled", "creator", "created", "updated",
		"updator" }, allowSetters = false, allowGetters = true)
public class AppUser extends PanacheEntity {

	// public Long id;
	@Column(unique = true, nullable = false)
	public String username;
	@Column(nullable = false)
	public String password;
	public String role = "USER";
	public Boolean enabled = true;
	public String deviceToken = "";

	@JsonbTransient
	@ManyToOne()
	@JoinColumn(name = "creatorUser", insertable = true, updatable = false)
	public AppUser creator;
	@Column(insertable = true, updatable = false)
	public LocalDateTime created;
	@JsonbTransient
	@ManyToOne()
	@JoinColumn(name = "updatorUser")
	public AppUser updator;
	public LocalDateTime updated;

	public AppUser() {
	}

	public AppUser(final String username, final String password) {
		super();
		this.username = username;
		this.password = password;
	}

	@PrePersist
	void onCreate() {
		this.created = LocalDateTime.now();
		this.updated = LocalDateTime.now();
	}

	@PreUpdate
	void onUpdate() {
		this.updated = LocalDateTime.now();
	}
	

    @Transactional
    public static AppUser getActiveAppUser(SecurityContext securityContext) {
        return AppUser.find("username", securityContext.getUserPrincipal().getName()).firstResult();
    }

    @Transactional
    public static AppUser getAppUserWithName(String appUserName) {
        return AppUser.find("username", appUserName).firstResult();
    }

    @Transactional
    public static AppUser persistNewUser(AppUser newUser, String userRole, AppUser creator) {
        newUser.role = userRole;
        newUser.enabled = true;
        newUser.deviceToken = "";
        newUser.creator = creator;
        newUser.updator = newUser.creator;
        newUser.persistAndFlush();
        return newUser;
    }

}

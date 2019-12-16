package com.mhmaem.bootstrap.models;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import io.quarkus.hibernate.orm.panache.PanacheEntity;

@Entity
@JsonIgnoreProperties(value = { "creator", "created" }, allowSetters = false, allowGetters = true)
public class NotificationRequest extends PanacheEntity {

    @NotNull
    @NotEmpty
    @NotBlank
    public String deviceID;
    @NotNull
    @NotEmpty
    @NotBlank
    public String notificationText;

    @ManyToOne()
    @JoinColumn(name = "creatorUser", insertable = true, updatable = false)
    public AppUser creator;
    @Column(insertable = true, updatable = false)
    public LocalDateTime created;

    public NotificationRequest() {
    }

    @PrePersist
    void onCreate() {
        this.created = LocalDateTime.now();
    }

	public NotificationRequest(@NotNull @NotEmpty @NotBlank String deviceID,
			@NotNull @NotEmpty @NotBlank String notificationText) {
		super();
		this.deviceID = deviceID;
		this.notificationText = notificationText;
	}

}

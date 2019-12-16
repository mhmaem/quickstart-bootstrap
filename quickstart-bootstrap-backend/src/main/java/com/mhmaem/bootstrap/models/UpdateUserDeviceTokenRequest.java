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
public class UpdateUserDeviceTokenRequest extends PanacheEntity {

    @NotNull
    @NotEmpty
    @NotBlank
    public String userDeviceToken;

    @ManyToOne()
    @JoinColumn(name = "creatorUser", insertable = true, updatable = false)
    public AppUser creator;
    @Column(insertable = true, updatable = false)
    public LocalDateTime created;

    public UpdateUserDeviceTokenRequest() {
    }

    @PrePersist
    void onCreate() {
        this.created = LocalDateTime.now();
    }

    public UpdateUserDeviceTokenRequest(@NotNull @NotEmpty @NotBlank String userDeviceToken) {
        super();
        this.userDeviceToken = userDeviceToken;
    }

}

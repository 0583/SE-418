package com.zfet.illumi.struct;


import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="user", schema="illumi_database", catalog="")
@JsonIgnoreProperties(value={"handler", "hibernateLazyInitializer", "fieldHandler"})
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "username"
)
public class IUser {

    private String username;
    private String password;
    private List<Image> images;

    public IUser() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "username", length = 255)
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Basic
    @Column(name = "password", length = 32)
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

<<<<<<< HEAD
    @OneToMany(cascade={CascadeType.REMOVE},fetch=FetchType.EAGER,
            targetEntity = Image.class,mappedBy = "username")
    @JsonIgnoreProperties(value={"user"})
    public List<Image>getImages(){
=======
    @OneToMany(cascade = {CascadeType.REMOVE}, fetch = FetchType.EAGER,
            targetEntity = Image.class, mappedBy = "username")
    public List<Image> getImages() {
>>>>>>> afb65d82881fe09b3f9aef488a4b65fd3b63696f
        return this.images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }

}
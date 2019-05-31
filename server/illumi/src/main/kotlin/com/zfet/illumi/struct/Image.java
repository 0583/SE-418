package com.zfet.illumi.struct;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.sql.Blob;
import java.util.List;

@Entity
@Table(name="image", schema="illumi_database", catalog="")
@JsonIgnoreProperties(value={"handler", "hibernateLazyInitializer", "fieldHandler"})

public class Image {

    private int imageid;
    private Blob imagecontent;
    private String username;
    private List<Tag> tags;

    public Image() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "imageid")
    public int getImageid() {
        return this.imageid;
    }

    public void setImageid(int Imageid) {
        this.imageid = imageid;
    }

    @Basic
    @Column(name = "imagecontent")
    public Blob getImagecontent() {
        return this.imagecontent;
    }

    public void setImagecontent(Blob imagecontent) {
        this.imagecontent = imagecontent;
    }

    @Basic
    @Column(name = "username")
    @JsonIgnore
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "hastag", joinColumns = @JoinColumn(name = "imageid"),
            inverseJoinColumns = @JoinColumn(name = "tagid"))
    @JsonIgnoreProperties(value = {"images"})
    public List<Tag> getTags() {
        return this.tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}

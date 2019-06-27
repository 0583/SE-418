package com.zfet.illumi.struct;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="image", schema="illumi_database", catalog="")
@JsonIgnoreProperties(value={"handler", "hibernateLazyInitializer", "fieldHandler"})
@JsonIdentityInfo(
        generator = ObjectIdGenerators.PropertyGenerator.class,
        property = "imageid"
)
public class Image {

    private int imageid;
    private char[] imagecontent;
    private String username;
    private List<Tag> tags;

    public Image() {
    }

    @Id
<<<<<<< HEAD
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="imageid")
    public int getImageid() {
        return this.imageid;
    }
    public void setImageid(int imageid) {
        this.imageid=imageid;
    }

    @Basic
    @Column(name="imagecontent")
    @JsonIgnore
    public char[] getImagecontent() {
        return this.imagecontent;
    }
    public void setImagecontent(char[] imagecontent) {
        this.imagecontent=imagecontent;
=======
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
>>>>>>> afb65d82881fe09b3f9aef488a4b65fd3b63696f
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

<<<<<<< HEAD
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name="hastag", joinColumns=@JoinColumn(name="imageid"),
            inverseJoinColumns = @JoinColumn(name="tagid"))
    @JsonIgnoreProperties(value={"images"})
    public List<Tag> getTags(){
=======
    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name = "hastag", joinColumns = @JoinColumn(name = "imageid"),
            inverseJoinColumns = @JoinColumn(name = "tagid"))
    @JsonIgnoreProperties(value = {"images"})
    public List<Tag> getTags() {
>>>>>>> afb65d82881fe09b3f9aef488a4b65fd3b63696f
        return this.tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}

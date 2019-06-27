package com.zfet.illumi.struct;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="tag", schema="illumi_database", catalog="")
@JsonIgnoreProperties(value={"handler", "hibernateLazyInitializer", "fieldHandler"})
public class Tag {
    private int tagid;
    private String tagname;
    private List<Image> images;

    public Tag() {
    }

    @Id
<<<<<<< HEAD
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name="tagid")
=======
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "tagid")
>>>>>>> afb65d82881fe09b3f9aef488a4b65fd3b63696f
    public int getTagid() {
        return tagid;
    }

    public void setTagid(int tagid) {
        this.tagid = tagid;
    }

    @Basic
    @Column(name = "tagname", length = 255)
    public String getTagname() {
        return tagname;
    }

    public void setTagname(String tagname) {
        this.tagname = tagname;
    }

<<<<<<< HEAD
    @ManyToMany(fetch=FetchType.EAGER, mappedBy="tags")
    @JsonIgnoreProperties(value={"tags"})
    public List<Image> getImages(){
=======
    @ManyToMany(fetch = FetchType.LAZY, mappedBy = "tags")
    @JsonIgnoreProperties(value = {"tags"})
    public List<Image> getImages() {
>>>>>>> afb65d82881fe09b3f9aef488a4b65fd3b63696f
        return this.images;
    }

    public void setImages(List<Image> images) {
        this.images = images;
    }
}

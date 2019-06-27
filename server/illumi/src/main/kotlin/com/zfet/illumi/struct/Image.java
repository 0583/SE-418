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

    public Image(){}

    @Id
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
    }

    @Basic
    @Column(name="username")
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(name="hastag", joinColumns=@JoinColumn(name="imageid"),
            inverseJoinColumns = @JoinColumn(name="tagid"))
    @JsonIgnoreProperties(value={"images"})
    public List<Tag> getTags(){
        return this.tags;
    }
    public void setTags(List<Tag> tags){
        this.tags=tags;
    }
}

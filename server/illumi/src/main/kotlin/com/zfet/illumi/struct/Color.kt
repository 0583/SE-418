
/*
package com.zfet.illumi.struct

import com.fasterxml.jackson.annotation.JsonIgnoreProperties
import java.sql.Blob
import javax.persistence.Entity
import javax.persistence.Table

@Entity
@Table(name = "color", schema = "illumi_database", catalog = "")
@JsonIgnoreProperties(value = ["handler", "hibernateLazyInitializer", "fieldHandler"])
public class Color {
    private var colorName: String? = null
    private var aliasName: String? = null
    private var rgbTuple: List<Int>? = null
    private var cmykTuple: List<Int>? = null

    fun getProperAliasName(): String? {
        if (this.aliasName == null) {
            return null
        }
        val fixedAliasName: String = this.aliasName!!.replace("v", "yu")
        return fixedAliasName.toUpperCase() + fixedAliasName.substring(1)
    }

    fun generateRgbJson(): String? {
        try {
            return String.format("""{
            "r": %d,
            "g": %d,
            "b": %d
}""".trimIndent(), this.rgbTuple!![0], this.rgbTuple!![1], this.rgbTuple!![2])
        } catch (ex: Exception) {
            ex.printStackTrace()
            return null
        }
    }
}

        */
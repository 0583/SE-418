package com.zfet.illumi.controller

import com.zfet.illumi.service.ImageService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RestController

@RestController
@RequestMapping(value = "/gallery")
class GalleryController {
    @Autowired
    private lateinit var imageService: ImageService
}
const ProductPhotoController = require("../controllers/product-photo-controller.js")

const Router = require("express").Router

const router = Router()

router.get("/product-photo/:id", ProductPhotoController.getProductPhotosByProjectId)
router.get("/product-photo", ProductPhotoController.getProductPhotos)
router.post("/product-photo", ProductPhotoController.loadPhoto)

module.exports = router
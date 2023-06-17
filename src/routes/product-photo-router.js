const ProductPhotoController = require("../controllers/product-photo-controller.js")

const Router = require("express").Router

const router = Router()

router.get("/product-photos/:id", ProductPhotoController.getProductPhotosByProjectId)
router.get("/product-photos", ProductPhotoController.getProductPhotos)
router.post("/product-photos/:id", ProductPhotoController.loadPhoto)

module.exports = router
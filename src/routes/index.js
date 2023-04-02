const Router = require("express").Router;
const authRouter = require("./auth-router.js")
const categoryRouter = require("./category-router.js")
const subCategoryRouter = require("./subcategory-router.js")
const productRouter = require("./product-router.js")
const productPhotoRouter = require("./product-photo-router.js")
const sliderRouter = require("./slider-router.js")
const router = Router()

router.use("/auth", authRouter)
router.use(categoryRouter)
router.use(subCategoryRouter)
router.use(productRouter)
router.use(productPhotoRouter)
router.use(sliderRouter)

module.exports = router
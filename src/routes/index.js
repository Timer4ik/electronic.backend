const Router = require("express").Router;
const authRouter = require("./auth-router.js")
const categoryRouter = require("./category-router.js")
// const subCategoryRouter = require("./subcategory-router.js")
const productRouter = require("./product-router.js")
const productPhotoRouter = require("./product-photo-router.js")
const sliderRouter = require("./slider-router.js")
const promoRouter = require("./promo-router.js")
const propertyTypeRouter = require("./property-type-router.js")
const propertyRouter = require("./property-router.js")
const router = Router()

router.use("/auth", authRouter)
router.use(categoryRouter)
// router.use(subCategoryRouter)
router.use(productRouter)
router.use(productPhotoRouter)
router.use(sliderRouter)
router.use(promoRouter)
router.use(propertyTypeRouter)
router.use(propertyRouter)

module.exports = router
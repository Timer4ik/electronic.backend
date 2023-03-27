const Router = require("express").Router;
const authRouter = require("./auth-router.js")
const categoryRouter = require("./category-router.js")
const subCategoryRouter = require("./subcategory-router")
const productRouter = require("./product-router.js")

const router = Router()

router.use("/auth", authRouter)
router.use(categoryRouter)
router.use(subCategoryRouter)
router.use(productRouter)

module.exports = router
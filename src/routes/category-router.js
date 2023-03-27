const CategoryController = require("../controllers/category-controller")

const Router = require("express").Router

const router = Router()

router.get("/categories", CategoryController.getCategories)

module.exports = router